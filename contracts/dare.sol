pragma solidity >=0.4.21 < 0.7.0;
contract Dare
{
    address public manager;
    address[] public players;
    // msg is a global one it is available in any function envocation
    // ex : msg.sender,msg.gas,msg.data etc

    constructor() public
    {
        manager = msg.sender;
    }
    // when someone call this function they send along some ether
    function enter() public payable {
        require(msg.value > 0.01 ether,"User not authorized to pick a winner");
        players.push(msg.sender);
    }

    function random() private view returns (uint) 
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players)));
    }

   function pickaWinner() public restricted {
        uint idx = random()%players.length;
        players[idx].transfer(address(this).balance);
        players = new address[](0); // I am emptying the players array
    }

    modifier restricted {
        require(msg.sender == manager,"User not authorized to pick a winner");
        _;
    }

    function getAllPlayers() public view returns (address[] memory)
    {
        return players;
    }
}
