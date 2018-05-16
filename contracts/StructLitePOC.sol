pragma solidity 0.4.23;


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

    TestStruct1 public testStruct1;

    // store1 1 byte (boolean)
    uint256 private constant OFFSET01 = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 private constant MASK01 = 0x00000000000000000000000000000000000000000000000000000000000000FF;
    uint256 private constant NEGATIVE_MASK01 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00;
    // store1 20 bytes (address)
    uint256 private constant OFFSET02 = 0x0000000000000000000000000000000000000000000000000000000000000100;
    uint256 private constant MASK02 = 0x0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00;
    uint256 private constant NEGATIVE_MASK02 = 0xFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000FF;
    // store1 1 byte (bytes1)
    uint256 private constant OFFSET03 = 0x0000000000000000000001000000000000000000000000000000000000000000;
    uint256 private constant MASK03 = 0x00000000000000000000FF000000000000000000000000000000000000000000;
    uint256 private constant NEGATIVE_MASK03 = 0xFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    // store1 2 bytes (bytes2)
    uint256 private constant OFFSET04 = 0x0000000000000000000100000000000000000000000000000000000000000000;
    uint256 private constant MASK04 = 0x0000000000000000FFFF00000000000000000000000000000000000000000000;
    uint256 private constant NEGATIVE_MASK04 = 0xFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    // store1 3 bytes (bytes3)
    uint256 private constant OFFSET05 = 0x0000000000000001000000000000000000000000000000000000000000000000;
    uint256 private constant MASK05 = 0x0000000000FFFFFF000000000000000000000000000000000000000000000000;
    uint256 private constant NEGATIVE_MASK05 = 0xFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    // store1 4 bytes (bytes4)
    uint256 private constant OFFSET06 = 0x0000000001000000000000000000000000000000000000000000000000000000;
    uint256 private constant MASK06 = 0x00FFFFFFFF000000000000000000000000000000000000000000000000000000;
    uint256 private constant NEGATIVE_MASK06 = 0xFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    // store1 5 bytes (bytes5)
    uint256 private constant OFFSET07 = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 private constant MASK07 = 0x000000000000000000000000000000000000000000000000000000FFFFFFFFFF;
    uint256 private constant NEGATIVE_MASK07 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000;
    // store1 6 bytes (bytes6)
    uint256 private constant OFFSET08 = 0x0000000000000000000000000000000000000000000000000000010000000000;
    uint256 private constant MASK08 = 0x000000000000000000000000000000000000000000FFFFFFFFFFFF0000000000;
    uint256 private constant NEGATIVE_MASK08 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFF;
    // store1 7 bytes (bytes7)
    uint256 private constant OFFSET09 = 0x0000000000000000000000000000000000000000010000000000000000000000;
    uint256 private constant MASK09 = 0x0000000000000000000000000000FFFFFFFFFFFFFF0000000000000000000000;
    uint256 private constant NEGATIVE_MASK09 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFFFFFFFFFFFFFFFFFFF;
    // store1 8 bytes (bytes8)
    uint256 private constant OFFSET10 = 0x0000000000000000000000000001000000000000000000000000000000000000;
    uint256 private constant MASK10 = 0x000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000;
    uint256 private constant NEGATIVE_MASK10 = 0xFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    // store1 9 bytes (bytes9)
    uint256 private constant OFFSET11 = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 private constant MASK11 = 0x0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF;
    uint256 private constant NEGATIVE_MASK11 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000;
    // store1 10 bytes (bytes10)
    uint256 private constant OFFSET12 = 0x0000000000000000000000000000000000000000000001000000000000000000;
    uint256 private constant MASK12 = 0x00000000000000000000000000FFFFFFFFFFFFFFFFFFFF000000000000000000;
    uint256 private constant NEGATIVE_MASK12 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000FFFFFFFFFFFFFFFFFF;
    // store1 11 bytes (bytes11)
    uint256 private constant OFFSET13 = 0x0000000000000000000000000100000000000000000000000000000000000000;
    uint256 private constant MASK13 = 0x0000FFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000;
    uint256 private constant NEGATIVE_MASK13 = 0xFFFF0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    // store1 12 bytes (bytes12)
    uint256 private constant OFFSET14 = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 private constant MASK14 = 0x0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF;
    uint256 private constant NEGATIVE_MASK14 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000;

    bytes32[4] public liteStruct1;

    function initiateStruct() public {
        testStruct1._bool = true;
        testStruct1._address = address(0xF);
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
    }

    function setTestStruct1() public {
        liteStruct1[0] = bytes32(
            (uint256(liteStruct1[0]) & (
                NEGATIVE_MASK01 |
                NEGATIVE_MASK02 |
                NEGATIVE_MASK03 |
                NEGATIVE_MASK04 |
                NEGATIVE_MASK05 |
                NEGATIVE_MASK06
            )) |
            (uint256(0xFF) * OFFSET01) & MASK01 |
            (uint256(address(0xF)) * OFFSET02) & MASK02 |
            (uint256(bytes1(1)) * OFFSET03) & MASK03 |
            (uint256(bytes2(2)) * OFFSET04) & MASK04 |
            (uint256(bytes3(3)) * OFFSET05) & MASK05 |
            (uint256(bytes4(4)) * OFFSET06) & MASK06
        );
        liteStruct1[1] = bytes32(
            (uint256(liteStruct1[1]) & (
                NEGATIVE_MASK07 |
                NEGATIVE_MASK08 |
                NEGATIVE_MASK09 |
                NEGATIVE_MASK10
            )) |
            (uint256(bytes5(5)) * OFFSET07) & MASK07 |
            (uint256(bytes6(6)) * OFFSET08) & MASK08 |
            (uint256(bytes7(7)) * OFFSET09) & MASK09 |
            (uint256(bytes8(8)) * OFFSET10) & MASK10
        );
        liteStruct1[2] = bytes32(
            (uint256(liteStruct1[2]) & (
                NEGATIVE_MASK11 |
                NEGATIVE_MASK12 |
                NEGATIVE_MASK13
            )) |
            (uint256(bytes9(9)) * OFFSET11) & MASK11 |
            (uint256(bytes10(10)) * OFFSET12) & MASK12 |
            (uint256(bytes11(11)) * OFFSET13) & MASK13
        );
        liteStruct1[3] = bytes32(
            (uint256(liteStruct1[3]) & NEGATIVE_MASK14) |
            (uint256(bytes12(12)) * OFFSET14) & MASK14
        );
    }

    function setTestStruct2() public {
        setTestStruct1Bool(true);
        setTestStruct1Address(address(0xF));
        setTestStruct1Bytes1(bytes1(1));
        setTestStruct1Bytes2(bytes2(2));
        setTestStruct1Bytes3(bytes3(3));
        setTestStruct1Bytes4(bytes4(4));
        setTestStruct1Bytes5(bytes5(5));
        setTestStruct1Bytes6(bytes6(6));
        setTestStruct1Bytes7(bytes7(7));
        setTestStruct1Bytes8(bytes8(8));
        setTestStruct1Bytes9(bytes9(9));
        setTestStruct1Bytes10(bytes10(10));
        setTestStruct1Bytes11(bytes11(11));
        setTestStruct1Bytes12(bytes12(12));
    }

    function setTestStruct1Bool(bool _bool) public {
        if (_bool) {
            liteStruct1[0] = bytes32(
                (uint256(liteStruct1[0]) & NEGATIVE_MASK01) | OFFSET01
            );
        } else {
            liteStruct1[0] = bytes32(uint256(liteStruct1[0]) & NEGATIVE_MASK01);
        }
    }

    function setTestStruct1Address(address _address) public {
        liteStruct1[0] = bytes32(
            (uint256(liteStruct1[0]) & NEGATIVE_MASK02) | ((uint256(_address) * OFFSET02) & MASK02)
        );
    }

    function setTestStruct1Bytes1(bytes1 _bytes1) public {
        liteStruct1[0] = bytes32(
            (uint256(liteStruct1[0]) & NEGATIVE_MASK03) | ((uint256(_bytes1) * OFFSET03) & MASK03)
        );
    }

    function setTestStruct1Bytes2(bytes2 _bytes2) public {
        liteStruct1[0] = bytes32(
            (uint256(liteStruct1[0]) & NEGATIVE_MASK04) | ((uint256(_bytes2) * OFFSET04) & MASK04)
        );
    }

    function setTestStruct1Bytes3(bytes3 _bytes3) public {
        liteStruct1[0] = bytes32(
            (uint256(liteStruct1[0]) & NEGATIVE_MASK05) | ((uint256(_bytes3) * OFFSET05) & MASK05)
        );
    }

    function setTestStruct1Bytes4(bytes4 _bytes4) public {
        liteStruct1[0] = bytes32(
            (uint256(liteStruct1[0]) & NEGATIVE_MASK06) | ((uint256(_bytes4) * OFFSET06) & MASK06)
        );
    }

    function setTestStruct1Bytes5(bytes5 _bytes5) public {
        liteStruct1[1] = bytes32(
            (uint256(liteStruct1[1]) & NEGATIVE_MASK07) | ((uint256(_bytes5) * OFFSET07) & MASK07)
        );
    }

    function setTestStruct1Bytes6(bytes6 _bytes6) public {
        liteStruct1[1] = bytes32(
            (uint256(liteStruct1[1]) & NEGATIVE_MASK08) | ((uint256(_bytes6) * OFFSET08) & MASK08)
        );
    }

    function setTestStruct1Bytes7(bytes7 _bytes7) public {
        liteStruct1[1] = bytes32(
            (uint256(liteStruct1[1]) & NEGATIVE_MASK09) | ((uint256(_bytes7) * OFFSET09) & MASK09)
        );
    }

    function setTestStruct1Bytes8(bytes8 _bytes8) public {
        liteStruct1[1] = bytes32(
            (uint256(liteStruct1[1]) & NEGATIVE_MASK10) | ((uint256(_bytes8) * OFFSET10) & MASK10)
        );
    }

    function setTestStruct1Bytes9(bytes9 _bytes9) public {
        liteStruct1[2] = bytes32(
            (uint256(liteStruct1[2]) & NEGATIVE_MASK11) | ((uint256(_bytes9) * OFFSET11) & MASK11)
        );
    }

    function setTestStruct1Bytes10(bytes10 _bytes10) public {
        liteStruct1[2] = bytes32(
            (uint256(liteStruct1[2]) & NEGATIVE_MASK12) | ((uint256(_bytes10) * OFFSET12) & MASK12)
        );
    }

    function setTestStruct1Bytes11(bytes11 _bytes11) public {
        liteStruct1[2] = bytes32(
            (uint256(liteStruct1[2]) & NEGATIVE_MASK13) | ((uint256(_bytes11) * OFFSET13) & MASK13)
        );
    }

    function setTestStruct1Bytes12(bytes12 _bytes12) public {
        liteStruct1[3] = bytes32(
            (uint256(liteStruct1[3]) & NEGATIVE_MASK14) | ((uint256(_bytes12) * OFFSET14) & MASK14)
        );
    }

    function getTestStruct1Bool() public view returns(bool _bool) {
        _bool = (uint256(liteStruct1[0]) & MASK01) / OFFSET01 != 0x0;
    }

    function getTestStruct1Address() public view returns(address _address) {
        _address = address((uint256(liteStruct1[0]) & MASK02) / OFFSET02);
    }

    function getTestStruct1Bytes1() public view returns(bytes1 _bytes1) {
        _bytes1 = bytes1((uint256(liteStruct1[0]) & MASK03) / OFFSET03);
    }

    function getTestStruct1Bytes2() public view returns(bytes2 _bytes2) {
        _bytes2 = bytes2((uint256(liteStruct1[0]) & MASK04) / OFFSET04);
    }

    function getTestStruct1Bytes3() public view returns(bytes3 _bytes3) {
        _bytes3 = bytes3((uint256(liteStruct1[0]) & MASK05) / OFFSET05);
    }

    function getTestStruct1Bytes4() public view returns(bytes4 _bytes4) {
        _bytes4 = bytes4((uint256(liteStruct1[0]) & MASK06) / OFFSET06);
    }

    function getTestStruct1Bytes5() public view returns(bytes5 _bytes5) {
        _bytes5 = bytes5((uint256(liteStruct1[1]) & MASK07) / OFFSET07);
    }

    function getTestStruct1Bytes6() public view returns(bytes6 _bytes6) {
        _bytes6 = bytes6((uint256(liteStruct1[1]) & MASK08) / OFFSET08);
    }

    function getTestStruct1Bytes7() public view returns(bytes7 _bytes7) {
        _bytes7 = bytes7((uint256(liteStruct1[1]) & MASK09) / OFFSET09);
    }

    function getTestStruct1Bytes8() public view returns(bytes8 _bytes8) {
        _bytes8 = bytes8((uint256(liteStruct1[1]) & MASK10) / OFFSET10);
    }

    function getTestStruct1Bytes9() public view returns(bytes9 _bytes9) {
        _bytes9 = bytes9((uint256(liteStruct1[2]) & MASK11) / OFFSET11);
    }

    function getTestStruct1Bytes10() public view returns(bytes10 _bytes10) {
        _bytes10 = bytes10((uint256(liteStruct1[2]) & MASK12) / OFFSET12);
    }

    function getTestStruct1Bytes11() public view returns(bytes11 _bytes11) {
        _bytes11 = bytes11((uint256(liteStruct1[2]) & MASK13) / OFFSET13);
    }

    function getTestStruct1Bytes12() public view returns(bytes12 _bytes12) {
        _bytes12 = bytes12((uint256(liteStruct1[3]) & MASK14) / OFFSET14);
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
