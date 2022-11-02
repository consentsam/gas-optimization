// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/3_ArrayIncrement.sol";

contract ArrayIncrementTest is Test {
    uint256 immutable BASE_GAS_COST = 44100;
    uint256[] arr = [3, 5, 7, 9, 12, 31]; //SUM = 67

    ArrayIncrement arrayIncrement;

    function setUp() public {
        arrayIncrement = new ArrayIncrement();
    }

    function testShouldHaveCorrectValues() public {
        uint256 prevCounter = arrayIncrement.counter();
        arrayIncrement.incrementBy(arr);
        uint256 currentCounter = arrayIncrement.counter();
        assertEq(currentCounter, prevCounter + 67);
    }

    function testShouldPassGasTest() public {
        uint256 checkPoint1 = gasleft();
        arrayIncrement.incrementBy(arr);
        uint256 gasUsed = checkPoint1 - gasleft();

        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, should be less than %d", gasUsed, BASE_GAS_COST);
        }
        assertLe(gasUsed, BASE_GAS_COST);
    }
}
