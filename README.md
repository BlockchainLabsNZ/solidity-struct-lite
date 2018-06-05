# StructLite

The solidity compiler tries it's best, but let's help it out a little. This library saves you gas when you are using structs that require more write access than read access and cases where you would call functions with multiple parameters and actual space can be saved by compacting the data.

It implements a technique called **byte packing** and abstracts all of the math in a EVM optimized way.

## Getting Started

### Prerequisites

* A solidity contract that makes use of the `struct` type

### Installation

Install node dependencies

```bash
npm install
```

### Usage

```bash
node index.js ExampleContract.sol
```

## Running the tests

First create a build for the struct you'd like to optimize for writing.

```bash
node index.js ExampleContract.sol
```

Then run the generated tests on the build folder

```bash
cd build
truffle test
```

The generated tests consist on possible usages of the struct and there are also some gas usage comparisons with a normal struct approach.

## TODO

* Make better report on gas usage comparisons.
* Booleans should be packed as a bit, not a byte.
* At the moment this project provides writing _1_ variable or _all_ of them. There must be an option for the developer to request a method to write a subset of variables.
* Add specific struct configurations for edge cases in the code to check that changes don't break compatibility.
