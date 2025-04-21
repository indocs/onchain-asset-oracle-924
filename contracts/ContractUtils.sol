// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Lightweight utility library included to extend the repository with a small, safe addition.
// This library is intentionally self-contained and does not depend on external contracts.
library ContractUtils {
    // Returns the maximum of two unsigned integers.
    function max(uint a, uint b) internal pure returns (uint) {
        return a >= b ? a : b;
    }
}
