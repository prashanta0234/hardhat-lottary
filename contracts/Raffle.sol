// SPDX-License-Identifier: UNLICENSED
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
pragma solidity >=0.7.0 <0.9.0;

contract Raffle is VRFConsumerBaseV2 {
    uint256 private minimunEth;
    address payable[] private players;
    uint256[] public s_randomWords;
    error Please_Send_Minium_Eth();

    // events
    event raffle(address indexed player);

    constructor(address vrfCoordinator, uint256 ethValue) VRFConsumerBaseV2(vrfCoordinator) {
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

    function requestRandomWords() external {}

    function fulfillRandomWords(
        uint256, /* requestId */
        uint256[] memory randomWords
    ) internal override {
        s_randomWords = randomWords;
    }
}
