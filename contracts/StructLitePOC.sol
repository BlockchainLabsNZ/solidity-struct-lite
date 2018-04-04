pragma solidity ^0.4.19;


contract StructLitePOC {
    struct TestStruct1 {
        // a Boolean has 1 bit
        bool _bool;
        // an Address has 20 bytes
        address _address;
        // length in bytes
        bytes1 _bytes1;
        bytes2 _bytes2;
        bytes3 _bytes3;
        bytes4 _bytes4;
        bytes5 _bytes5;
        bytes6 _bytes6;
        bytes7 _bytes7;
        bytes8 _bytes8;
        bytes9 _bytes9;
        bytes10 _bytes10;
        bytes11 _bytes11;
        bytes12 _bytes12;
    }

    // struct TestStruct2 {
    //     bytes13 _bytes13;
    //     bytes14 _bytes14;
    //     bytes15 _bytes15;
    //     bytes16 _bytes16;
    //     bytes17 _bytes17;
    //     bytes18 _bytes18;
    //     bytes19 _bytes19;
    //     bytes20 _bytes20;
    //     bytes21 _bytes21;
    //     bytes22 _bytes22;
    //     bytes23 _bytes23;
    //     bytes24 _bytes24;
    //     bytes25 _bytes25;
    //     bytes26 _bytes26;
    // }

    // struct TestStruct3 {
    //     bytes27 _bytes27;
    //     bytes28 _bytes28;
    //     bytes29 _bytes29;
    //     bytes30 _bytes30;
    //     bytes31 _bytes31;
    //     bytes32 _bytes32;
    //     // length in bits
    //     uint8 _uint8;
    //     uint16 _uint16;
    //     uint24 _uint24;
    //     uint32 _uint32;
    //     uint40 _uint40;
    //     uint48 _uint48;
    //     uint56 _uint56;
    //     uint64 _uint64;
    // }

    // struct TestStruct4 {
    //     uint72 _uint72;
    //     uint80 _uint80;
    //     uint88 _uint88;
    //     uint96 _uint96;
    //     uint104 _uint104;
    //     uint112 _uint112;
    //     uint120 _uint120;
    //     uint128 _uint128;
    //     uint136 _uint136;
    //     uint144 _uint144;
    //     uint152 _uint152;
    //     uint160 _uint160;
    //     uint168 _uint168;
    //     uint176 _uint176;
    // }

    // struct TestStruct5 {
    //     uint184 _uint184;
    //     uint192 _uint192;
    //     uint200 _uint200;
    //     uint208 _uint208;
    //     uint216 _uint216;
    //     uint224 _uint224;
    //     uint232 _uint232;
    //     uint240 _uint240;
    //     uint248 _uint248;
    //     uint256 _uint256;
    //     int8 _int8;
    //     int16 _int16;
    //     int24 _int24;
    //     int32 _int32;
    // }

    // struct TestStruct6 {
    //     int40 _int40;
    //     int48 _int48;
    //     int56 _int56;
    //     int64 _int64;
    //     int72 _int72;
    //     int80 _int80;
    //     int88 _int88;
    //     int96 _int96;
    //     int104 _int104;
    //     int112 _int112;
    //     int120 _int120;
    //     int128 _int128;
    //     int136 _int136;
    //     int144 _int144;
    // }

    // struct TestStruct7 {
    //     int152 _int152;
    //     int160 _int160;
    //     int168 _int168;
    //     int176 _int176;
    //     int184 _int184;
    //     int192 _int192;
    //     int200 _int200;
    //     int208 _int208;
    //     int216 _int216;
    //     int224 _int224;
    //     int232 _int232;
    //     int240 _int240;
    //     int248 _int248;
    //     int256 _int256;
    // }

    TestStruct1 public testStruct1;
    // TestStruct2 public testStruct2;
    // TestStruct3 public testStruct3;
    // TestStruct4 public testStruct4;
    // TestStruct5 public testStruct5;
    // TestStruct6 public testStruct6;
    // TestStruct7 public testStruct7;

    uint256[] public offsets1;
    // uint16[] public offsets2;
    // uint16[] public offsets3;
    // uint16[] public offsets4;
    // uint16[] public offsets5;
    // uint16[] public offsets6;
    // uint16[] public offsets7;

    uint256[] public masks1;
    // uint16[] public masks2;
    // uint16[] public masks3;
    // uint16[] public masks4;
    // uint16[] public masks5;
    // uint16[] public masks6;
    // uint16[] public masks7;

    bytes32[4] public liteStruct1;
    // bytes32[] public liteStruct2;
    // bytes32[] public liteStruct3;
    // bytes32[] public liteStruct4;
    // bytes32[] public liteStruct5;
    // bytes32[] public liteStruct6;
    // bytes32[] public liteStruct7;

    function StructLitePOC() public {
        offsets1 = [
            0x0000000000000000000000000000000000000000000000000000000000000001, // store1 1 byte (boolean)
            0x0000000000000000000000000000000000000000000000000000000000000100, // store1 20 bytes (address)
            0x0000000000000000000001000000000000000000000000000000000000000000, // store1 1 byte (bytes1)
            0x0000000000000000000100000000000000000000000000000000000000000000, // store1 2 bytes (bytes2)
            0x0000000000000001000000000000000000000000000000000000000000000000, // store1 3 bytes (bytes3)
            0x0000000001000000000000000000000000000000000000000000000000000000, // store1 4 bytes (bytes4)
            0x0000000000000000000000000000000000000000000000000000000000000001, // store1 5 bytes (bytes5)
            0x0000000000000000000000000000000000000000000000000000010000000000, // store1 6 bytes (bytes6)
            0x0000000000000000000000000000000000000000010000000000000000000000, // store1 7 bytes (bytes7)
            0x0000000000000000000000000001000000000000000000000000000000000000, // store1 8 bytes (bytes8)
            0x0000000000000000000000000000000000000000000000000000000000000001, // store1 9 bytes (bytes9)
            0x0000000000000000000000000000000000000000000001000000000000000000, // store1 10 bytes (bytes10)
            0x0000000000000000000000000100000000000000000000000000000000000000, // store1 11 bytes (bytes11)
            0x0000000000000000000000000000000000000000000000000000000000000001  // store1 12 bytes (bytes12)
        ];
        masks1 = [
            0x00000000000000000000000000000000000000000000000000000000000000FF, // store1 1 byte (boolean)
            0x0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00, // store1 20 bytes (address)
            0x00000000000000000000FF000000000000000000000000000000000000000000, // store1 1 byte (bytes1)
            0x0000000000000000FFFF00000000000000000000000000000000000000000000, // store1 2 bytes (bytes2)
            0x0000000000FFFFFF000000000000000000000000000000000000000000000000, // store1 3 bytes (bytes3)
            0x00FFFFFFFF000000000000000000000000000000000000000000000000000000, // store1 4 bytes (bytes4)
            0x000000000000000000000000000000000000000000000000000000FFFFFFFFFF, // store1 5 bytes (bytes5)
            0x000000000000000000000000000000000000000000FFFFFFFFFFFF0000000000, // store1 6 bytes (bytes6)
            0x0000000000000000000000000000FFFFFFFFFFFFFF0000000000000000000000, // store1 7 bytes (bytes7)
            0x000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000, // store1 8 bytes (bytes8)
            0x0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF, // store1 9 bytes (bytes9)
            0x00000000000000000000000000FFFFFFFFFFFFFFFFFFFF000000000000000000, // store1 10 bytes (bytes10)
            0x0000FFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000, // store1 11 bytes (bytes11)
            0x0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF  // store1 12 bytes (bytes12)
        ];

        // offsets2 = [104, 216, 336, 464, 600, 744, 896, 1056, 1224, 1400, 1584, 1776, 1976];
        // offsets3 = [216, 440, 672, 912, 1160, 1416, 1424, 1440, 1464, 1496, 1536, 1584, 1640];
        // offsets4 = [72, 152, 240, 336, 440, 552, 672, 800, 936, 1080, 1232, 1392, 1560];
        // offsets5 = [184, 376, 576, 784, 1000, 1224, 1456, 1696, 1944, 2200, 2208, 2224, 2248];
        // offsets6 = [40, 88, 144, 208, 280, 360, 448, 544, 648, 760, 880, 1008, 1144];
        // offsets7 = [152, 312, 480, 656, 840, 1032, 1232, 1440, 1656, 1880, 2112, 2352, 2600];
    }

    function initiateStruct() public {
        testStruct1._bool = true;
        testStruct1._address = 0xF;
        testStruct1._bytes1 = bytes1(1);
        testStruct1._bytes2 = bytes2(2);
        testStruct1._bytes3 = bytes3(3);
        testStruct1._bytes4 = bytes4(4);
        testStruct1._bytes5 = bytes5(5);
        testStruct1._bytes6 = bytes6(6);
        testStruct1._bytes7 = bytes7(7);
        testStruct1._bytes8 = bytes8(8);
        testStruct1._bytes9 = bytes9(9);
        testStruct1._bytes10 = bytes10(10);
        testStruct1._bytes11 = bytes11(11);
        testStruct1._bytes12 = bytes12(12);

        // testStruct2._bytes13 = bytes13(13);
        // testStruct2._bytes14 = bytes14(14);
        // testStruct2._bytes15 = bytes15(15);
        // testStruct2._bytes16 = bytes16(16);
        // testStruct2._bytes17 = bytes17(17);
        // testStruct2._bytes18 = bytes18(18);
        // testStruct2._bytes19 = bytes19(19);
        // testStruct2._bytes20 = bytes20(20);
        // testStruct2._bytes21 = bytes21(21);
        // testStruct2._bytes22 = bytes22(22);
        // testStruct2._bytes23 = bytes23(23);
        // testStruct2._bytes24 = bytes24(24);
        // testStruct2._bytes25 = bytes25(25);
        // testStruct2._bytes26 = bytes26(26);

        // testStruct3._bytes27 = bytes27(27);
        // testStruct3._bytes28 = bytes28(28);
        // testStruct3._bytes29 = bytes29(29);
        // testStruct3._bytes30 = bytes30(30);
        // testStruct3._bytes31 = bytes31(31);
        // testStruct3._bytes32 = bytes32(32);
        // testStruct3._uint8 = 8;
        // testStruct3._uint16 = 16;
        // testStruct3._uint24 = 24;
        // testStruct3._uint32 = 32;
        // testStruct3._uint40 = 40;
        // testStruct3._uint48 = 48;
        // testStruct3._uint56 = 56;
        // testStruct3._uint64 = 64;

        // testStruct4._uint72 = 72;
        // testStruct4._uint80 = 80;
        // testStruct4._uint88 = 88;
        // testStruct4._uint96 = 96;
        // testStruct4._uint104 = 104;
        // testStruct4._uint112 = 112;
        // testStruct4._uint120 = 120;
        // testStruct4._uint128 = 128;
        // testStruct4._uint136 = 136;
        // testStruct4._uint144 = 144;
        // testStruct4._uint152 = 152;
        // testStruct4._uint160 = 160;
        // testStruct4._uint168 = 168;
        // testStruct4._uint176 = 176;

        // testStruct5._uint184 = 184;
        // testStruct5._uint192 = 192;
        // testStruct5._uint200 = 200;
        // testStruct5._uint208 = 208;
        // testStruct5._uint216 = 216;
        // testStruct5._uint224 = 224;
        // testStruct5._uint232 = 232;
        // testStruct5._uint240 = 240;
        // testStruct5._uint248 = 248;
        // testStruct5._uint256 = 256;
        // testStruct5._int8 = -8;
        // testStruct5._int16 = -16;
        // testStruct5._int24 = -24;
        // testStruct5._int32 = -32;

        // testStruct6._int40 = -40;
        // testStruct6._int48 = -48;
        // testStruct6._int56 = -56;
        // testStruct6._int64 = -64;
        // testStruct6._int72 = -72;
        // testStruct6._int80 = -80;
        // testStruct6._int88 = -88;
        // testStruct6._int96 = -96;
        // testStruct6._int104 = -104;
        // testStruct6._int112 = -112;
        // testStruct6._int120 = -120;
        // testStruct6._int128 = -128;
        // testStruct6._int136 = -136;
        // testStruct6._int144 = -144;

        // testStruct7._int152 = -152;
        // testStruct7._int160 = -160;
        // testStruct7._int168 = -168;
        // testStruct7._int176 = -176;
        // testStruct7._int184 = -184;
        // testStruct7._int192 = -192;
        // testStruct7._int200 = -200;
        // testStruct7._int208 = -208;
        // testStruct7._int216 = -216;
        // testStruct7._int224 = -224;
        // testStruct7._int232 = -232;
        // testStruct7._int240 = -240;
        // testStruct7._int248 = -248;
        // testStruct7._int256 = -256;
    }

    function setTestStruct1() public {
        liteStruct1[0] = bytes32(uint256(0xFF) * offsets1[0] | uint256(0xF) * offsets1[1] | 1 * offsets1[2] | 2 * offsets1[3] | 3 * offsets1[4] | 4 * offsets1[5]);
        liteStruct1[1] = bytes32(5 * offsets1[6] | 6 * offsets1[7] | 7 * offsets1[8] | 8 * offsets1[9]);
        liteStruct1[2] = bytes32(9 * offsets1[10] | 10 * offsets1[11] | 11 * offsets1[12]);
        liteStruct1[3] = bytes32(12 * offsets1[13]);
    }

    function getTestStruct1Bool() public view returns(bool _bool) {
        _bool = (uint256(liteStruct1[0]) & masks1[0]) / offsets1[0] != 0x0;
    }

    function getTestStruct1Address() public view returns(address _address) {
        _address = address((uint256(liteStruct1[0]) & masks1[1]) / offsets1[1]);
    }

    function getTestStruct1Bytes1() public view returns(bytes1 _bytes1) {
        _bytes1 = bytes1((uint256(liteStruct1[0]) & masks1[2]) / offsets1[2]);
    }

    function getTestStruct1Bytes2() public view returns(bytes2 _bytes2) {
        _bytes2 = bytes2((uint256(liteStruct1[0]) & masks1[3]) / offsets1[3]);
    }

    function getTestStruct1Bytes3() public view returns(bytes3 _bytes3) {
        _bytes3 = bytes3((uint256(liteStruct1[0]) & masks1[4]) / offsets1[4]);
    }

    function getTestStruct1Bytes4() public view returns(bytes4 _bytes4) {
        _bytes4 = bytes4((uint256(liteStruct1[0]) & masks1[5]) / offsets1[5]);
    }

    function getTestStruct1Bytes5() public view returns(bytes5 _bytes5) {
        _bytes5 = bytes5((uint256(liteStruct1[1]) & masks1[6]) / offsets1[6]);
    }

    function getTestStruct1Bytes6() public view returns(bytes6 _bytes6) {
        _bytes6 = bytes6((uint256(liteStruct1[1]) & masks1[7]) / offsets1[7]);
    }

    function getTestStruct1Bytes7() public view returns(bytes7 _bytes7) {
        _bytes7 = bytes7((uint256(liteStruct1[1]) & masks1[8]) / offsets1[8]);
    }

    function getTestStruct1Bytes8() public view returns(bytes8 _bytes8) {
        _bytes8 = bytes8((uint256(liteStruct1[1]) & masks1[9]) / offsets1[9]);
    }

    function getTestStruct1Bytes9() public view returns(bytes9 _bytes9) {
        _bytes9 = bytes9((uint256(liteStruct1[2]) & masks1[10]) / offsets1[10]);
    }

    function getTestStruct1Bytes10() public view returns(bytes10 _bytes10) {
        _bytes10 = bytes10((uint256(liteStruct1[2]) & masks1[11]) / offsets1[11]);
    }

    function getTestStruct1Bytes11() public view returns(bytes11 _bytes11) {
        _bytes11 = bytes11((uint256(liteStruct1[2]) & masks1[12]) / offsets1[12]);
    }

    function getTestStruct1Bytes12() public view returns(bytes12 _bytes12) {
        _bytes12 = bytes12((uint256(liteStruct1[3]) & masks1[13]) / offsets1[13]);
    }

    function getStruct1Bool() public view returns(bool _bool) {
        _bool = testStruct1._bool;
    }

    function getStruct1Address() public view returns(address _address) {
        _address = testStruct1._address;
    }

    function getStruct1Bytes1() public view returns(bytes1 _bytes1) {
        _bytes1 = testStruct1._bytes1;
    }

    function getStruct1Bytes2() public view returns(bytes2 _bytes2) {
        _bytes2 = testStruct1._bytes2;
    }

    function getStruct1Bytes3() public view returns(bytes3 _bytes3) {
        _bytes3 = testStruct1._bytes3;
    }

    function getStruct1Bytes4() public view returns(bytes4 _bytes4) {
        _bytes4 = testStruct1._bytes4;
    }

    function getStruct1Bytes5() public view returns(bytes5 _bytes5) {
        _bytes5 = testStruct1._bytes5;
    }

    function getStruct1Bytes6() public view returns(bytes6 _bytes6) {
        _bytes6 = testStruct1._bytes6;
    }

    function getStruct1Bytes7() public view returns(bytes7 _bytes7) {
        _bytes7 = testStruct1._bytes7;
    }

    function getStruct1Bytes8() public view returns(bytes8 _bytes8) {
        _bytes8 = testStruct1._bytes8;
    }

    function getStruct1Bytes9() public view returns(bytes9 _bytes9) {
        _bytes9 = testStruct1._bytes9;
    }

    function getStruct1Bytes10() public view returns(bytes10 _bytes10) {
        _bytes10 = testStruct1._bytes10;
    }

    function getStruct1Bytes11() public view returns(bytes11 _bytes11) {
        _bytes11 = testStruct1._bytes11;
    }

    function getStruct1Bytes12() public view returns(bytes12 _bytes12) {
        _bytes12 = testStruct1._bytes12;
    }

    function getTestStruct1() public view returns(
        bool _bool,
        address _address,
        bytes1 _bytes1,
        bytes2 _bytes2,
        bytes3 _bytes3,
        bytes4 _bytes4,
        bytes5 _bytes5,
        bytes6 _bytes6,
        bytes7 _bytes7,
        bytes8 _bytes8,
        bytes9 _bytes9,
        bytes10 _bytes10,
        bytes11 _bytes11,
        bytes12 _bytes12
    ) {
        _bool = getTestStruct1Bool();
        _address = getTestStruct1Address();
        _bytes1 = getTestStruct1Bytes1();
        _bytes2 = getTestStruct1Bytes2();
        _bytes3 = getTestStruct1Bytes3();
        _bytes4 = getTestStruct1Bytes4();
        _bytes5 = getTestStruct1Bytes5();
        _bytes6 = getTestStruct1Bytes6();
        _bytes7 = getTestStruct1Bytes7();
        _bytes8 = getTestStruct1Bytes8();
        _bytes9 = getTestStruct1Bytes9();
        _bytes10 = getTestStruct1Bytes10();
        _bytes11 = getTestStruct1Bytes11();
        _bytes12 = getTestStruct1Bytes12();
    }
}
