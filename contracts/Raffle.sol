pragma solidity ^0.4.17;

contract Raffle {
    address public manager;
    address[] public players;

    function Raffle() public {
        manager = msg.sender;
    }

    function enter() public payable funds {
        players.push(msg.sender);
    }
    
    function pickWinner() public restricted {
        address winner = players[random() % players.length];
        winner.transfer(this.balance);
        
        players = new address[](0);
    }

    function getPlayers() public view returns (address[]) {
        return players;
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    modifier funds() {
        require(msg.value >= 1 ether);
        _;
    }
}