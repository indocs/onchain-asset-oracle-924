# Onchain Asset Oracle - Usage Notes

This repository contains a simple on-chain asset price oracle implemented in Solidity and tested via Hardhat.

What you can use:

- Read the latest asset price via the contract's public getter (implementation specifics depend on the deployed contract in tests).
- Deploy locally using the existing Hardhat script and tests.

Notes:

- This update adds no behavioral changes to the existing contracts to maintain test stability.
- If you plan to extend functionality (e.g., access control, pause functionality, or batch price updates), please coordinate with the test suite to add corresponding tests and ensure compilation success.

Recommended next steps for contributors:

- Introduce an access-controlled pause mechanism (requiring owner privileges) and guard price-update functions.
- Add unit tests for any new features to prevent regressions.
- Expand deployment scripts to support testnet deployments with environment variables.

For now, you can reference the existing test cases in test/ to understand how the oracle is currently exercised.