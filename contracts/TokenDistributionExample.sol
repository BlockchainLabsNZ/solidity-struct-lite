pragma solidity 0.4.24;


contract TokenDistributionExample {
    // Let's create a Struct that uses only 32 bytes.
    struct TokenDistribution {
        // an Address has 20 bytes
        address to;
        // uint96 uses 12 bytes.
        // The max number for a uint96 is big enough for
        // most token distribution scenarios.
        // 79,228,162,514,264,337,593,543,950,335
        uint96 amount;
    }
}
