import { expect } from "chai";
import { ethers } from "hardhat";

describe("OnchainAssetOracle access control", function () {
  it("only owner can set asset price", async function () {
    const [owner, nonOwner] = await ethers.getSigners();

    const OnchainAssetOracleFactory = await ethers.getContractFactory("OnchainAssetOracle");
    const oracle = await OnchainAssetOracleFactory.deploy();
    await oracle.deployed();

    // Owner should be able to set price
    await expect(oracle.connect(owner).setAssetPrice(1, 100)).to.not.be.reverted;

    // Non-owner should be rejected
    await expect(oracle.connect(nonOwner).setAssetPrice(2, 200)).to.be.reverted;
  });
});
