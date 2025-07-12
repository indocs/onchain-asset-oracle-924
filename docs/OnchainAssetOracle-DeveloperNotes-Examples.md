# OnchainAssetOracle - Developer Notes: Quick Examples

This document provides a couple of small, self-contained usage examples for developers integrating with the OnchainAssetOracle contract suite.

Note: These examples assume a Hardhat environment and that the contracts have been compiled and deployed in a test network (e.g., Hardhat Network).

1) Basic read of an asset value from the oracle

- Prerequisites:
  - The OnchainAssetOracle contract is deployed.
  - An example asset key (bytes32) is known, e.g., keccak256("ETH/USD").

- Steps:
  - Instantiate the contract in your test script or script file.
  - Call getAssetValue(bytes32 assetKey) and handle return value (uint256).

- Example (pseudo-code):
  - assetKey := keccak256("ETH/USD")
  - value := oracle.getAssetValue(assetKey)
  - emit SomeValue(value)

2) Updating trusted data source (allowed by owner)

- Prerequisites:
  - The caller is the contract owner.
  - The contract exposes a function to set a trusted data source (e.g., setTrustedSource(address) or similar).

- Steps:
  - Call the owner-only function to register a new trusted oracle address.
  - After this, the contract should be able to fetch data from that trusted source according to its internal logic.

3) Event expectations for data updates

- When a data update occurs (either via a trusted oracle or an internal mechanism), an event is typically emitted.
- In tests, you can assert that the event Fired with the correct asset key and value.

4) Testing tips

- Use Hardhat Network for faster tests.
- Mock asset keys with deterministic values, e.g., keccak256("ASSET/PAIR").
- Validate access controls by attempting to call owner-only functions from a non-owner account and expect a revert.

If you’d like, I can add concrete TypeScript tests that exercise these flows against the current contract setup, or extend the contracts with a small, well-documented API surface tailored for testing and integrations.