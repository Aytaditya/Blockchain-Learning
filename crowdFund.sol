//SPDX-License-Identifier:MIT
pragma solidity ^0.8.11;

contract Campaign{
    address public manager;
    uint public minContribution;
    address[] public approvers;

    //Constructor: During deployment, msg.sender in the constructor refers to the address of the account that initiates the contract deployment transaction. This becomes the contract's manager.

    //contribute Function: When someone contributes funds (calls the contribute function), msg.sender represents the address of the account sending those funds. This becomes an "approver" in the contract, not the manager.

    constructor(uint minimum){
        manager=msg.sender;
        minContribution=minimum;
    }

    function contribute() public payable{
        require(msg.value>minContribution);
        approvers.push(msg.sender);
    }
}


    
