// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Dispenser {
    uint256 immutable public startTime;
    uint256 immutable public startTime2;
    address payable  immutable addr1;
    address payable  immutable  addr2;
    address payable  immutable addr3;
    
    constructor(address[3] memory _receivers) payable {
        addr1 = payable(_receivers[0]);
        addr2 = payable(_receivers[1]);
        addr3 = payable(_receivers[2]);
        startTime = block.timestamp;
        startTime2 = startTime + 3 days;
    }
    
    function dispense() external payable{
        string memory errorMessage = "Dispense period has not started"; 

        bool isDispensePeriodStarted = block.timestamp > startTime2;
        require(isDispensePeriodStarted,errorMessage);

        uint amount = address(this).balance / 3;
        (addr1).transfer(amount);
        (addr2).transfer(amount);
        (addr3).transfer(amount);
    }
}
