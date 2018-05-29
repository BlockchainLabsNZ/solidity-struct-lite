const fs = require("fs");
const SolidityParser = require("solidity-parser");
const Handlebars = require("handlebars");
const _ = require("lodash");
const pluralize = require("pluralize");
const constants = require("./src/constants.js");
const { execSync } = require("child_process");

const fetchStructs = function(statement) {
  if (statement.type == "StructDeclaration") {
    return statement;
  }

  if (_.isEmpty(statement.body)) {
    return [];
  }

  if (_.isArray(statement.body)) {
    return _.flattenDeep(
      statement.body.map(function(child) {
        return fetchStructs(child);
      })
    );
  }

  if (_.isObject(statement.body)) {
    return _.flattenDeep(fetchStructs(statement.body));
  }
};

const calculateMask = function(
  byte_length,
  previousMask = "0x0000000000000000000000000000000000000000000000000000000000000000"
) {
  let remaining_nibbles = previousMask.split("x")[1].split("F")[0].length;
  if (remaining_nibbles < byte_length * 2) {
    remaining_nibbles = 64;
  }
  return [
    "0x",
    _.repeat("0", remaining_nibbles - byte_length * 2),
    _.repeat("F", byte_length * 2),
    _.repeat("0", 64 - remaining_nibbles)
  ].join("");
};

const calculateOffset = function(mask) {
  let trailing_nibbles = _.last(mask.split("x")[1].split("F")).length;
  return [
    "0x",
    _.repeat("0", 64 - trailing_nibbles - 1),
    "1",
    _.repeat("0", trailing_nibbles)
  ].join("");
};

const calculateNegativeMask = function(mask) {
  let negatedMask = mask
    .split("x")[1]
    .split("")
    .map(function(nibble) {
      return constants.negate[nibble];
    })
    .join("");
  return ["0x", negatedMask].join("");
};

const calculateName = function(name) {
  let snakeName = _.snakeCase(name);
  return {
    CONSTANT: _.toUpper(snakeName),
    lowerCamelCase: _.camelCase(snakeName),
    UpperCamelCase: _.upperFirst(_.camelCase(snakeName)),
    lower_snake_case: snakeName,
    Upper_snake_case: _.upperFirst(snakeName),
    Plural: pluralize(_.upperFirst(_.camelCase(snakeName))),
    plural: pluralize(_.camelCase(snakeName))
  };
};

const parseStruct = function(struct) {
  let variables = struct.body.reduce(function(accumulator, variable) {
    let type = variable.literal.literal;
    let byte_length = constants.byte_length[type];
    let mask;
    let slot;
    if (accumulator.length > 0) {
      mask = calculateMask(byte_length, _.last(accumulator).mask);
      slot = _.last(accumulator).slot;
    } else {
      mask = calculateMask(byte_length);
      slot = -1;
    }
    let offset = calculateOffset(mask);
    let isFirst = _.last(offset.split("")) == "1";
    if (isFirst) {
      slot++;
    }
    accumulator.push({
      name: calculateName(variable.name),
      type: type,
      byte_length: byte_length,
      slot: slot,
      offset: offset,
      mask: mask,
      negative_mask: calculateNegativeMask(mask),
      isBool: type == "bool",
      isAddress: type == "address",
      isBytes: type.startsWith("bytes"),
      isUint: type.startsWith("uint"),
      isInt: type.startsWith("int"),
      isFirst: isFirst
    });
    return accumulator;
  }, []);
  let slots = [];
  variables.forEach(function(variable) {
    if (slots[variable.slot] == undefined) {
      slots[variable.slot] = [];
    }
    slots[variable.slot].push(variable);
  });

  return {
    name: calculateName(struct.name),
    variables: variables,
    slots: slots,
    slotsArray: slots.length > 1,
    slotsLength: _.last(variables).slot + 1
  };
};

if (typeof process.argv[2] === "undefined") {
  console.log(
    "You did not specify a filename. Usage: node index.js [contract.sol]"
  );
} else {
  main(process.argv[2]);
}

function getCompiledLibrary(pathToTpl) {
  return Handlebars.compile(fs.readFileSync(pathToTpl).toString());
}

function main(filepath) {
  // Create Build Directory if it doesn't already exist
  const BUILD_DIR = "./build/";
  if (!fs.existsSync(BUILD_DIR)) {
    fs.mkdirSync(BUILD_DIR);
  }
  let out = execSync("truffle init", { cwd: "build/" });
  const BUILD_DIRS = ["/test/scenarios/", "/test/utils/"];
  BUILD_DIRS.forEach(dirName => {
    if (!fs.existsSync(BUILD_DIR + dirName)) {
      fs.mkdirSync(BUILD_DIR + dirName);
    }
  });

  const tree = SolidityParser.parseFile(filepath);
  const structs = fetchStructs(tree);
  // const structs = require("./test/StructLitePOC.js");

  let migration_counter = 1;
  structs.forEach(struct => {
    struct = parseStruct(struct);
    // All directories in outputPath are relative to the BUILD_DIR
    let templates = [
      // Contracts
      {
        path: "./src/templates/contracts/StructLite.mustache",
        outputPath: "contracts/" + struct.name.Plural + ".sol"
      },
      {
        path: "./src/templates/contracts/StructLiteCoder.mustache",
        outputPath: "contracts/" + struct.name.Plural + "Coder.sol"
      },
      // Mock Contracts
      // {
      //   "path": "./src/templates/test/mocks/StructLiteMock.mustache",
      //   "outputPath": "test/mocks/" + struct.name.UpperCamelCase + ".sol"
      // },
      // Test Scenarios
      {
        path:
          "./src/templates/test/scenarios/FunctionParametersScenario.mustache",
        outputPath:
          "test/scenarios/" +
          struct.name.Plural +
          "FunctionParametersScenario.sol"
      },
      {
        path: "./src/templates/test/scenarios/SingleStructScenario.mustache",
        outputPath:
          "test/scenarios/" + struct.name.Plural + "SingleStructScenario.sol"
      },
      {
        path: "./src/templates/test/scenarios/StructArrayScenario.mustache",
        outputPath:
          "test/scenarios/" + struct.name.Plural + "StructArrayScenario.sol"
      },
      // Spec files
      {
        path:
          "./src/templates/test/function_parameters_scenario_specs.mustache",
        outputPath:
          "test/" +
          struct.name.lower_snake_case +
          "_function_parameters_scenario_specs.js"
      },
      {
        path: "./src/templates/test/single_struct_scenario_specs.mustache",
        outputPath:
          "test/" +
          struct.name.lower_snake_case +
          "_single_struct_scenario_specs.js"
      },
      {
        path: "./src/templates/test/struct_array_scenario_specs.mustache",
        outputPath:
          "test/" +
          struct.name.lower_snake_case +
          "_struct_array_scenario_specs.js"
      },
      // Utils
      {
        path: "./src/templates/test/utils/comparator.mustache",
        outputPath: "test/utils/comparator.js"
      },
      {
        path: "./src/templates/test/utils/constants.mustache",
        outputPath: "test/utils/constants.js"
      },
      // Migrations
      {
        path: "./src/templates/migrations/2_deploy_contracts.mustache",
        outputPath:
          "migrations/" +
          ++migration_counter +
          "_deploy_" +
          struct.name.lower_snake_case +
          "_contracts.js"
      },
      {
        path: "./src/templates/migrations/3_deploy_scenarios.mustache",
        outputPath:
          "migrations/" +
          ++migration_counter +
          "_deploy_" +
          struct.name.lower_snake_case +
          "_scenarios.js"
      }
    ];

    templates.forEach(function processTemplate(tplData) {
      let library = getCompiledLibrary(tplData["path"]);
      let output = library(struct);
      let filename = filepath.replace(/^.*[\\\/]/, "");
      fs.writeFile(BUILD_DIR + tplData["outputPath"], output, function(err) {
        if (err) {
          return console.log(err);
        }
        console.log(BUILD_DIR + tplData["outputPath"] + " created");
      });
    });
  });
}
