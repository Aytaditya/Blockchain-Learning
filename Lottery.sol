
pragma solidity ^0.8.11;

contract Lottery {

    address public manager;
    address[] public players;

    constructor()  {
        manager=msg.sender;
    }

    // whenever we create a function that expects to receieve ether we mark it as payable
    function enter() public payable {
        require(msg.value >0.01 ether);  //amount of ether that was sent (in wei)
        players.push(msg.sender);
    }

    //dont want anyone to call this
    //this is sudo-random
    function random() private view returns (uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));

    //now is decrepted we now use block.timestamp for time
    //this random function will return very large number
    }

    
}