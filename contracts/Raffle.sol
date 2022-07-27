// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Raffle {
    uint256 private minimunEth;
    address payable[] private players;
    error Please_Send_Minium_Eth();

    // events
    event raffle(address indexed player);

    constructor(uint256 ethValue) {
        minimunEth = ethValue;
    }

    function enterRaffle() public payable {
        if (msg.value < minimunEth) {
            revert Please_Send_Minium_Eth();
        }
        players.push(payable(msg.sender));
        emit raffle(msg.sender);
    }

    function getPlayers(uint256 index) public view {
        players[index];
    }
}
