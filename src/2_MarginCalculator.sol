pragma solidity ^0.8.13;

contract MarginCalculator {
    uint256 marginPercentage = 30;

    function getOwnerMargin(uint256 amount) public view returns (uint256 amountForSender, uint256 amountForOwner) {
        amountForSender = (amount * (100 - marginPercentage)) / 100;
        amountForOwner = (amount * marginPercentage) / 100;
    }
}
