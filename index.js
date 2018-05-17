const fs = require("fs");
const SolidityParser = require("solidity-parser");
const Mustache = require("mustache");
const Handlebars = require("handlebars");
const BigNumber = require("bignumber.js");
const _ = require("lodash");
const constants = require("./src/constants.js");
const structs = require("./test/StructLitePOC.js");

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

// const tree = SolidityParser.parseFile("./contracts/StructLitePOC.sol");
// let structs = fetchStructs(tree);

var library = Handlebars.compile(
  fs.readFileSync("./src/views/library.mustache").toString()
);
var variable_declaration = Handlebars.compile(
  fs.readFileSync("./src/views/variable_declaration.mustache").toString()
);
var variable_getter = Handlebars.compile(
  fs.readFileSync("./src/views/variable_getter.mustache").toString()
);
var first_variable_setter = Handlebars.compile(
  fs.readFileSync("./src/views/first_variable_setter.mustache").toString()
);
var variable_setter = Handlebars.compile(
  fs.readFileSync("./src/views/variable_setter.mustache").toString()
);
var bool_getter = Handlebars.compile(
  fs.readFileSync("./src/views/bool_getter.mustache").toString()
);
var bool_setter = Handlebars.compile(
  fs.readFileSync("./src/views/bool_setter.mustache").toString()
);

const parseStruct = function(struct) {
  let variables = struct.body.map(function(variable) {
    return {
      name: variable.name,
      type: variable.literal.literal,
      byte_length: constants.byte_length[variable.literal.literal],
      slot: 0,
      offset: "",
      mask: "",
      negative_mask: "",
      isBool: variable.literal.literal == "bool",
      isFirst: false
    };
  });
  let slots = [];

  return {
    name: struct.name,
    variables: variables,
    slots: slots
  };
};

structs.forEach(struct => {
  struct = parseStruct(struct);
  let output = library(struct);

  console.log(output);

  struct.variables.forEach(obj => {
    console.log(`${JSON.stringify(obj)}`);
  });
});
