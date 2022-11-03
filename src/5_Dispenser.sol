// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Dispenser {
    uint256 immutable public startTime;
    uint256 immutable public startTime2;
    address immutable addr1;
    address immutable  addr2;
    address immutable addr3;
    
    constructor(address[3] memory _receivers) payable {
        addr1 = _receivers[0];
        addr2 = _receivers[1];
        addr3 = _receivers[2];
        startTime = block.timestamp;
        startTime2 = startTime + 3 days;
    }
    
    function dispense() external payable{
        string memory errorMessage = "Dispense period has not started"; 
        require(block.timestamp > startTime2,errorMessage);

        uint amount = address(this).balance / 3;
        payable(addr1).transfer(amount);
        payable(addr2).transfer(amount);
        payable(addr3).transfer(amount);
    }
}
