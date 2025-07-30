// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OwnableLite.sol";

// AssetPriceHistory keeps a simple price history snapshot per asset.
// Only the contract owner can record new prices.
contract AssetPriceHistory is OwnableLite {
    struct PricePoint {
        uint256 price;
        uint256 ts;
    }

    // asset => latest price point
    mapping(bytes32 => PricePoint) private _latest;

    event PriceRecorded(bytes32 indexed asset, uint256 price, uint256 ts);

    // Records the latest price for an asset. OnlyOwner can call.
    function recordPrice(bytes32 asset, uint256 price) external onlyOwner {
        _latest[asset] = PricePoint({price: price, ts: block.timestamp});
        emit PriceRecorded(asset, price, block.timestamp);
    }

    // Returns the latest price and its timestamp for an asset.
    function getLatestPrice(bytes32 asset) external view returns (uint256 price, uint256 ts) {
        PricePoint memory p = _latest[asset];
        return (p.price, p.ts);
    }
}
