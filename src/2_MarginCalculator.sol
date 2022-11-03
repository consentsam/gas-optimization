pragma solidity ^0.8.13;

contract MarginCalculator {
    uint256 immutable marginPercentage = 30;

    function getOwnerMargin(uint256 amount) external pure returns (uint256 amountForSender, uint256 amountForOwner) {
        amountForOwner = (amount * marginPercentage) / 100;
        amountForSender = amount- amountForOwner;
    }
}
