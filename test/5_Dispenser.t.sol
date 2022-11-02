// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/5_Dispenser.sol";

contract DispenserTest is Test {
    uint256 immutable BASE_GAS_COST = 111000;
    uint256 immutable AMOUNT = 3 ether;

    Dispenser dispenser;

    address user1;
    address user2;
    address user3;

    function setUp() public {
        user1 = address(0xABCD);
        user2 = address(0xABDC);
        user3 = address(0xADBC);

        address[3] memory receivers = [user1, user2, user3];

        dispenser = (new Dispenser){value: AMOUNT}(receivers);
    }

    function testDispense() public {
        vm.warp(4 days);

        uint256 user1Balance = user1.balance;
        uint256 user2Balance = user2.balance;
        uint256 user3Balance = user3.balance;

        dispenser.dispense();

        uint256 increment = AMOUNT / 3;

        assertEq(user1.balance, user1Balance + increment);
        assertEq(user2.balance, user2Balance + increment);
        assertEq(user3.balance, user3Balance + increment);
    }

    function testShouldPassGasTest() public {
        vm.warp(4 days);

        uint256 checkPoint1 = gasleft();
        dispenser.dispense();
        uint256 gasUsed = checkPoint1 - gasleft();
        
        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, should be less than %d", gasUsed, BASE_GAS_COST);
        }

        console.logUint(gasUsed);
        assertLe(gasUsed, BASE_GAS_COST);
    }
}