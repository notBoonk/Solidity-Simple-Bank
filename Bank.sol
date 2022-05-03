// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Bank { 

    mapping(address => uint256) public AccountBalances;

    function deposit() external payable {
        AccountBalances[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 currentBalance = AccountBalances[msg.sender];
        require(currentBalance >= 0, "Account value is at zero.");

        AccountBalances[msg.sender] = 0;
        payable(msg.sender).transfer(currentBalance);
    }

}
