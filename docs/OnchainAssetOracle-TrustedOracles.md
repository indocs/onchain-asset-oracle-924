# Onchain Asset Oracle - Trusted Oracles

This document outlines how trusted oracles can be managed within the OnchainAssetOracle contract family. The underlying contract is expected to implement access control (commonly via OpenZeppelin's Ownable pattern) and expose a mechanism to designate certain addresses as trusted oracles.

Key concepts:

- Trusted Oracles: Addresses that are allowed to report or update asset prices in the oracle.
- Access control: Only authorized administrators (owner or designated roles) can modify the list of trusted oracles.
- Security considerations:
  - Validate input addresses to avoid accidental self-trust or misconfiguration.
  - Prefer emitting events when changing trust status for off-chain auditing.
  - Consider rate limiting updates or using multi-signature approval for critical asset price changes in production deployments.

Typical usage flow:

1. Deploy the OnchainAssetOracle contract with an owner (administrator).
2. Call setTrustedOracle(address, bool) to designate trusted oracles. This call should be restricted to the owner.
3. Trusted oracles call update/submitPrice(...) (or equivalent) to push asset prices to the contract.
4. Read back prices via view functions exposed by the contract.

Example events you may expect to see:
- Event: TrustedOracleUpdated(address indexed oracle, bool trusted);
  - Emitted when a trusted status is added or removed.

Notes:
- If your implementation uses a multi-step process for adding trusted oracles (e.g., multi-sig), ensure the contract exposes enough information publicly for auditability.
- Consider implementing additional protections such as revoking trust from a compromised address and a cooldown period before a new oracle becomes trusted.

For developers:
- Extend tests to cover: adding/removing trusted oracles, non-owner rejections, and oracle-restricted methods behaving correctly when a caller is not trusted.
- Document any new roles or permissions clearly in your deployment docs and README.
