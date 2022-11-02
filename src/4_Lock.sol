// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Lock {
    uint8 locked;

    function isLocked() public view returns (bool) {
        return locked == 0;
    }

    function unLock() external {
        locked = 1;
    }
}