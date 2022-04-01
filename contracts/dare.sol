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

    function random() private view returns (uint) 
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players)));
    }

   function pickaWinner() public restricted {
        uint idx = random() % players.length;
        payable(players[idx]).transfer(address(this).balance);
        players = new address[](0); // I am emptying the players array
    }

    modifier restricted {
        require(msg.sender == manager);
        _;
    }

    function getAllPlayers() public view returns (address[] memory)
    {
        return players;
    }
}
