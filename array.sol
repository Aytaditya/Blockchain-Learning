pragma solidity ^0.8.11;

contract Test {
    uint[] public myArray; //myArray button will automatically get created in remix just like the message button in the previous contract and it does not return the whole array it takes input and return the value of the index of the array


    //For dynamic data types like arrays (uint[]), you have three options for data location: memory, storage, and calldata.

    constructor() {
        myArray.push(1);
        myArray.push(2);
        myArray.push(3);
    }

    function getArray() public view returns (uint[] memory) {
        return myArray;
    }   

    function getArrayLength() public view returns (uint) {
        return myArray.length;
    }

    function getFirstElement() public view returns (uint) {
        return myArray[0];
    }
}
