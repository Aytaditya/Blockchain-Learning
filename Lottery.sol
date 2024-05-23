pragma solidity ^0.8.11;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() {
        manager = msg.sender; //msg.sender refers to the address of the account that is currently executing the function
    }

    // whenever we create a function that expects to receieve ether we mark it as payable
    function enter() public payable {
        require(msg.value > 0.01 ether); //amount of ether that was sent (in wei)
        //The require statement acts like a checkpoint in your code. It checks if a condition is true. If it is, the code continues executing.
        players.push(msg.sender);
    }

    //dont want anyone to call this
    //this is sudo-random
    function random() private view returns (uint) {
        return
            uint(
                keccak256(
                    abi.encodePacked(block.difficulty, block.timestamp, players)
                )
            );

        //now is decrepted we now use block.timestamp for time
        //this random function will return very large number
    }

    function pickWinner() public restricted {
        //only manager can pickWinner
        // require(msg.sender==manager);    // so we dont need this line we will be using it at many places hence made a modifier it

        // Calculate a random index within the range of the players array
        uint index = random() % players.length;

        // Transfer the balance of the contract to the winner
        address payable winner = payable(players[index]); // Cast the player address to payable
        winner.transfer(address(this).balance);

        // players[index] this gives address of the winner
        // payable(players[index]): The payable keyword here is used to explicitly convert the address players[index] to the payable type.

        players = new address[](0); //emptying the players array
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    //data not getting modified hence view is used
    function getPlayers() public view returns (address[] memory) {
        return players;

        //In Solidity, when returning dynamic data types like arrays from functions, you need to specify where the data is located: either in memory, storage, or calldata.
    }
}
