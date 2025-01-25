pragma solidity ^0.8.0;

// A small, self-contained access-controlled counter to illustrate incremental improvements
// without impacting the existing OnchainAssetOracle contract.
contract CounterGuard {
    address public owner;
    uint256 public count;

    modifier onlyOwner() {
        require(msg.sender == owner, "CounterGuard: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        count = 0;
    }

    // Increments the internal counter. Restricted to the contract owner.
    function increment() external onlyOwner {
        count += 1;
    }

    // Transfer ownership to a new address
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "CounterGuard: new owner is the zero address");
        owner = newOwner;
    }
}
