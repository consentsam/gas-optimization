// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Lock {
    bool internal locked = true;

    function isLocked() external view returns (bool) {
        return locked;
    }

    function unLock() external {
        locked = false;
    }
}