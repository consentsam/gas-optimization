// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/4_Lock.sol";

contract LockTest is Test {
    uint256 immutable BASE_GAS_COST = 27250;

    Lock lock;

    function setUp() public {
        lock = new Lock();
    }

    function testIsLocked() public {
        assertEq(lock.isLocked(), true);
    }

    function testUnLock() public {
        lock.unLock();
        assertEq(lock.isLocked(), false);
    }

    function testShouldPassGasTest() public {
        uint256 checkPoint1 = gasleft();
        lock.unLock();
        uint256 gasUsed = checkPoint1 - gasleft();

        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, should be less than %d", gasUsed, BASE_GAS_COST);
        }
        assertLe(gasUsed, BASE_GAS_COST);
    }
}
