# Developer notes: small extension

This document outlines a tiny, non-invasive extension to the OnchainAssetOracle that introduces a lightweight getter for the latest price along with its timestamp. It is intentionally designed to be purely read-only and does not modify contract state.

Changes in this incremental update:

- Add a read-only getter getPriceWithTimestamp() that returns (uint256 price, uint256 lastUpdated).
- Provides a stable, documented API for UI or scripts to fetch both value and freshness.
- No state changes or access control modifications to existing functions.

Usage example (Solidity):

```solidity
(uint256 p, uint256 ts) = onchainAssetOracle.getPriceWithTimestamp();
```

Usage example (TypeScript with ethers):

```ts
const [price, ts] = await oracle.getPriceWithTimestamp();
console.log(`Price: ${price}, Last Updated: ${ts}`);
```

Notes:

- If the underlying contract already exposes price and timestamp separately, this addition is a convenience wrapper in the source or a thin helper in a higher-level interface. If not, this doc explains how such a getter could be added in a follow-up patch.
- This change is safe for production since it does not modify any state.
