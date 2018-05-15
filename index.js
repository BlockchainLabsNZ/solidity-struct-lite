const fs = require("fs");
const SolidityParser = require("solidity-parser");
const Mustache = require("mustache");
const BigNumber = require("bignumber.js");
const _ = require("lodash");
const byte_length = require("./src/constants.js");
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

structs.forEach(struct => {
  template = fs.readFileSync("./src/views/library.mustache");
  let output = Mustache.render(template.toString(), struct);

  console.log(output);

  struct.body.forEach(obj => {
    console.log(`${JSON.stringify(obj)}`);
  });
});

let variable_data = {
  struct: "",
  index: 0,
  type: "",
  byte_length: 0,
  name: "",
  offset: "",
  mask: "",
  negative_mask: ""
};

console.log(JSON.stringify(structs));
