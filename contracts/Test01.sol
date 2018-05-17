pragma solidity 0.4.23;


contract Distributions {
    struct Distribution {
        // an Address has 20 bytes
        address to;
        // length in bytes
        uint96 amount;
    }

    Distribution public distribution;
}
