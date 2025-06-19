// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A small, standalone contract to demonstrate adding a trusted oracle helper.
// This contract can be used alongside OnchainAssetOracle to register trusted oracle addresses
// and perform simple access checks without modifying existing code paths.

contract TrustedOracle {
    address public owner;

    mapping(address => bool) public trustedOracles;

    event OracleTrusted(address indexed oracle);
    event OracleRevoked(address indexed oracle);
    event OwnerChanged(address indexed oldOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "TrustedOracle: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setOwner(address newOwner) external onlyOwner {
        require(newOwner != address(0), "TrustedOracle: new owner is the zero address");
        address old = owner;
        owner = newOwner;
        emit OwnerChanged(old, newOwner);
    }

    function addTrustedOracle(address oracle) external onlyOwner {
        require(oracle != address(0), "TrustedOracle: zero address not allowed");
        if (!trustedOracles[oracle]) {
            trustedOracles[oracle] = true;
            emit OracleTrusted(oracle);
        }
    }

    function removeTrustedOracle(address oracle) external onlyOwner {
        require(oracle != address(0), "TrustedOracle: zero address not allowed");
        if (trustedOracles[oracle]) {
            trustedOracles[oracle] = false;
            emit OracleRevoked(oracle);
        }
    }

    function isTrusted(address oracle) external view returns (bool) {
        return trustedOracles[oracle];
    }
}
