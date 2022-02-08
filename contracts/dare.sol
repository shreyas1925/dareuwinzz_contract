pragma solidity >=0.4.20;
contract Lottery
{
    address public manager;
    constructor() public {
        manager = msg.sender;
    }
}
