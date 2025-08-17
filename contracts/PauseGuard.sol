// A tiny guard utility for pausable contracts
// This library provides a single internal check to ensure a contract
// is not in a paused state. It does not manage state itself to keep
// dependencies minimal.
pragma solidity ^0.8.0;

library PauseGuard {
    function requireNotPaused(bool paused) internal pure {
        require(!paused, "Paused");
    }
}
