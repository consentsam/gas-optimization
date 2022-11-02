// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/1_Storage.sol";

contract StorageTest is Test {
    uint256 immutable BASE_GAS_COST = 121000;

    function testShouldHaveCorrectValues() public {
        Storage st = new Storage();
        assertEq(st.day(), 10);
        assertEq(st.amount(), uint256(1000));
        assertEq(st.ownerAddr(), address(0x4e653b730367e303D30d8FB39d7350D07a60dfD6));
    }

    function testShouldPassGasTest() public {
        uint256 checkPoint1 = gasleft();
        Storage st = new Storage();
        uint256 gasUsed = checkPoint1 - gasleft();

        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, should be less than %d", gasUsed, BASE_GAS_COST);
        }
        assertLe(gasUsed, BASE_GAS_COST);
    }
}
