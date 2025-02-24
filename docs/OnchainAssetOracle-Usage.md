# OnchainAssetOracle usage

This repository contains a minimal on-chain asset price oracle. It is intended for local testing with Hardhat and does not rely on external data feeds in this iteration.

Usage highlights:

- Deploy the contract via Hardhat scripts. The deployment script is at scripts/deploy.ts.
- Tests are located in test/OnchainAssetOracle.test.ts and exercise basic behavior.
- The contract exposes the current asset price and basic read-only accessors.

If you plan to extend the contract with admin controls (pause/unpause, admin role), consider adding a guarded access control mechanism to protect state-changing functions. This document provides a starting point for such enhancements and how you might test them locally.

Recommended next steps (not required for current tests):

1. Introduce an admin address in the contract and a setAdmin function.
2. Add pause/unpause guards to state-changing methods.
3. Extend tests to verify admin privileges and paused state behavior.

For now, ensure you run:

- npx hardhat test
- npm run build (if applicable)

This keeps the current behavior stable while you plan enhancements.
