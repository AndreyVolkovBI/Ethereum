pragma solidity 0.5.1;

import "./Math.sol";

contract MyContract {
    // using SafeMath for uint256
    // DRY - do not repeat yourself
    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        value = Math.divide(_value1, _value2);
    }
}
