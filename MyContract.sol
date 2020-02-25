pragma solidity ^0.5.1;

contract MyContract {
    string public constant value = "myValue";
    bool public myBool = true;
    int public myInt = 1;
    uint public myUint = 1; // (signed means could be negative)

    uint8 public myUint8 = 8;
    uint256 public myUint256 = 256;

    enum State { Waiting, Ready, Active }
    State public state;

    constructor() public {
        state = State.Waiting;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns(bool) {
        return state == State.Active;
    }


    // constructor() public {
        // value = "myValue";
    // }

    // function get() public view returns(string memory) {
    //     return value;
    // }

    // function set(string memory _value) public {
    //     value = _value;
    // }
}
