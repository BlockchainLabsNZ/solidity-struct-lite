const fs = require("fs");
const SolidityParser = require("solidity-parser");
const Mustache = require("mustache");
const Handlebars = require("handlebars");
const BigNumber = require("bignumber.js");
const _ = require("lodash");
const constants = require("./src/constants.js");

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
      name: variable.name,
      type: type,
      byte_length: byte_length,
      slot: slot,
      offset: offset,
      mask: mask,
      negative_mask: calculateNegativeMask(mask),
      isBool: type == "bool",
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
    name: struct.name,
    variables: variables,
    slots: slots,
    slotsLength: _.last(variables).slot + 1
  };
};

// const tree = SolidityParser.parseFile("./contracts/StructLitePOC.sol");
// const structs = fetchStructs(tree);
const structs = require("./test/StructLitePOC.js");

var library = Handlebars.compile(
  fs.readFileSync("./src/views/library.mustache").toString()
);

structs.forEach(struct => {
  struct = parseStruct(struct);
  let output = library(struct);

  console.log(output);
});
