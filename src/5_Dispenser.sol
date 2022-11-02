// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Dispenser {
    address[3] public receivers;
    uint256 public startTime;

    constructor(address[3] memory _receivers) payable {
        receivers = _receivers;
        startTime = block.timestamp;
    }

    function dispense() external {
        require(
            block.timestamp > startTime + 3 days,
            "Dispense period has not started"
        );

        uint amount = address(this).balance / 3;
        payable(receivers[0]).transfer(amount);
        payable(receivers[1]).transfer(amount);
        payable(receivers[2]).transfer(amount);
    }
}
