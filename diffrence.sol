//difference between view and returns

contract Example {
    uint public data;

    // View function that does not modify the state and returns a value
    function getData() public view returns (uint) {
        return data;
    }

    // Function that modifies the state and does not return a value
    function updateData(uint newValue) public {
        data = newValue;
    }
}
