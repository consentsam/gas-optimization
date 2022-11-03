pragma solidity ^0.8.13;

contract ArrayIncrement {
    uint256 public counter;

    function incrementBy(uint256[] calldata arr) external {
        uint sum = counter;
        uint len = arr.length;
        for (uint256 idx=0; idx < len;) {
            sum += arr[idx];
            unchecked {
                ++idx;
            }
        }
        counter = sum;
    }
}
