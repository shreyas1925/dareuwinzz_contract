pragma solidity >=0.4.20;
contract Lottery
{
    address public manager;
    address[] public players;

    // msg is a global one it is available in any function envocation
    // ex : msg.sender,msg.gas,msg.data etc

    constructor() public {
        manager = msg.sender;
    }
    // when someone call this function they send along some ether
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
}
