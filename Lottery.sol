
pragma solidity ^0.8.11;

contract Lottery {

    address public manager;
    address[] public players;

    constructor()  {
        manager=msg.sender;
    }

    // whenever we create a function that expects to receieve ether we mark it as payable
    function enter() public payable {
        players.push(msg.sender);
    }

    
}