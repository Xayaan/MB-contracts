import { BigNumber } from "@ethersproject/bignumber";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import chai from "chai";
import { deployContract, solidity } from "ethereum-waffle";
import hre, { ethers, upgrades } from "hardhat";
import { Artifact } from "hardhat/types";
import { ERC20, MoonBear, MoonBearTokenSale } from "../typechain";

import { ether, getTimeStamp, increaseTime, getSnapShot, revertEvm } from "./utils";

const { expect } = chai;

chai.use(solidity);

describe("Token Sale", function () {
  let owner: SignerWithAddress;
  let mbContract: MoonBear;
  let tokenSaleContract: MoonBearTokenSale;

  let buyer1: SignerWithAddress;
  let buyer2: SignerWithAddress;
  let buyer3: SignerWithAddress;

  const UNISWAP_ROUTER_ADDRESS = "0x7a250d5630b4cf539739df2c5dacb4c659f2488d";
  const USDT_ADDRESS = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
  const MBF_DECIMAL = BigNumber.from("1000000000");
  const ONEK_MBF = BigNumber.from("1000000000000");

  const softcap = BigNumber.from("10000").mul(MBF_DECIMAL); // 10^4 MBF, 10 BNB;
  const hardcap = BigNumber.from("1000000000").mul(MBF_DECIMAL); // 10^9 MBF, 10^6 BNB;
  const salePrice = BigNumber.from(1000000); // 1 MBF = 0.001 BNB, 1 BNB = 1000 MBF
  let starTime: number;
  const tokenSaleDuration = 10000; // 10000s
  let endTime: number;

  before(async function () {
    const signers: SignerWithAddress[] = await hre.ethers.getSigners();

    owner = signers[0];
    buyer1 = signers[1];
    buyer2 = signers[2];
    buyer3 = signers[3];

    const mbArtifact = await ethers.getContractFactory("MoonBear");
    mbContract = <MoonBear>await upgrades.deployProxy(mbArtifact, [UNISWAP_ROUTER_ADDRESS, USDT_ADDRESS]);

    starTime = (await getTimeStamp()) + 100;
    endTime = starTime + tokenSaleDuration;
    const tokenSaleArtifact: Artifact = await hre.artifacts.readArtifact("MoonBearTokenSale");
    tokenSaleContract = <MoonBearTokenSale>(
      await deployContract(owner, tokenSaleArtifact, [
        mbContract.address,
        softcap,
        hardcap,
        salePrice,
        starTime,
        tokenSaleDuration,
        ether(50),
      ])
    );

    await mbContract.connect(owner).excludeFromReward(tokenSaleContract.address);
    await mbContract.connect(owner).excludeFromFee(tokenSaleContract.address);
    await mbContract.connect(owner).setSaleContract(tokenSaleContract.address, true);
  });

  describe("Sale config", function () {
    it("whitelist buyer1 and buyer2", async function () {
      await tokenSaleContract.connect(owner).addToWhitelist([buyer1.address, buyer2.address]);
      expect(await tokenSaleContract.isWhitelisted(buyer1.address)).to.equal(true);
      expect(await tokenSaleContract.isWhitelisted(buyer2.address)).to.equal(true);
      expect(await tokenSaleContract.isWhitelisted(buyer3.address)).to.equal(false);
    });

    it("isSoftcapReached false", async () => {
      expect(await tokenSaleContract.isSoftcapReached()).to.equal(false);
    });

    it("calculatePurchaseAmount", async () => {
      expect(await tokenSaleContract.calculatePurchaseAmount(ether(1))).to.equal(BigNumber.from(1000).mul(MBF_DECIMAL));
    });

    it("tokenSaleEndTime", async () => {
      expect(await tokenSaleContract.tokenSaleEndTime()).to.equal(BigNumber.from(endTime));
    });
  });

  describe("when reached the softcap", function () {
    let snapshotID: any;
    before(async () => {
      snapshotID = await getSnapShot();
    });
    after(async () => {
      await revertEvm(snapshotID);
    });

    describe("buyTokens", () => {
      it("should fail before the startTime", async () => {
        await expect(
          tokenSaleContract.connect(buyer1).buyTokens(buyer1.address, { value: ether(1) }),
        ).to.be.revertedWith("Sale: not selling now");
      });

      it("should buy after the startTime", async () => {
        const timenow = await getTimeStamp();

        await increaseTime(starTime - timenow);
        await tokenSaleContract.connect(buyer1).buyTokens(buyer1.address, { value: ether(10) });
        expect(await tokenSaleContract.tokensSold()).to.equal(ONEK_MBF.mul(BigNumber.from(10)));
        expect(await tokenSaleContract.balanceOf(buyer1.address)).to.equal(ONEK_MBF.mul(BigNumber.from(10)));
        expect(await tokenSaleContract.tokensPurchased(buyer1.address)).to.equal(ONEK_MBF.mul(BigNumber.from(10)));
      });

      it("should fail for not whitelisted", async () => {
        await expect(
          tokenSaleContract.connect(buyer3).buyTokens(buyer1.address, { value: ether(1) }),
        ).to.be.revertedWith("Sale: whitelist");
      });

      it("should buy token after disable the whitelisting", async () => {
        await tokenSaleContract.connect(owner).enableWhitelist(false);

        await tokenSaleContract.connect(buyer3).buyTokens(buyer3.address, { value: ether(10) });
        expect(await tokenSaleContract.tokensSold()).to.equal(ONEK_MBF.mul(BigNumber.from(20)));
        expect(await tokenSaleContract.balanceOf(buyer3.address)).to.equal(ONEK_MBF.mul(BigNumber.from(10)));
        expect(await tokenSaleContract.tokensPurchased(buyer3.address)).to.equal(ONEK_MBF.mul(BigNumber.from(10)));
      });

      it("isSoftcapReached true", async () => {
        expect(await tokenSaleContract.isSoftcapReached()).to.equal(true);
      });

      it("withdrawToken, withdrawBNB fail before release", async () => {
        await expect(
          tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(1))),
        ).to.be.revertedWith("Sale: not released yet");
        await expect(tokenSaleContract.connect(buyer1).withdrawBNBWhenFailed()).to.be.revertedWith(
          "Sale: not released yet",
        );
      });
    });

    describe("increase time to end the sale, and release", async () => {
      it("release fail before increase time", async () => {
        await expect(tokenSaleContract.release()).to.be.revertedWith("Sale: not ended");
      });
      it("release fail before receive token", async () => {
        await increaseTime(tokenSaleDuration);
        await expect(tokenSaleContract.release()).to.be.revertedWith("Sale: not enough token to release");
      });
      it("release success", async () => {
        await mbContract.connect(owner).transfer(tokenSaleContract.address, hardcap);
        await tokenSaleContract.release();
        expect(await tokenSaleContract.released()).to.equal(true);
      });
    });

    describe("withdraw tokens", async () => {
      const oneWeek = 3600 * 24 * 7;
      it("withdrawBNB fail when softcap reached", async () => {
        await expect(tokenSaleContract.connect(buyer1).withdrawBNBWhenFailed()).to.be.revertedWith("Sale: not failed");
      });

      it("20% at first", async () => {
        expect(await tokenSaleContract.withdrawableBalance(buyer1.address)).to.be.equal(
          ONEK_MBF.mul(BigNumber.from(2)),
        );
      });

      it("should withdraw 20%", async () => {
        await tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(2)));
        expect(await mbContract.balanceOf(buyer1.address)).to.be.equal(ONEK_MBF.mul(BigNumber.from(2)));
        await expect(
          tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(1))),
        ).to.be.revertedWith("Sale: locked");
      });

      it("20% after 1 week", async () => {
        await increaseTime(oneWeek);
        await tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(2)));
        expect(await mbContract.balanceOf(buyer1.address)).to.be.equal(ONEK_MBF.mul(BigNumber.from(4)));
      });

      it("20% after 1 week", async () => {
        await increaseTime(oneWeek);
        await tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(2)));
        expect(await mbContract.balanceOf(buyer1.address)).to.be.equal(ONEK_MBF.mul(BigNumber.from(6)));
      });

      it("20% after 1 week", async () => {
        await increaseTime(oneWeek);
        await tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(2)));
        expect(await mbContract.balanceOf(buyer1.address)).to.be.equal(ONEK_MBF.mul(BigNumber.from(8)));
      });

      it("20% after 1 week", async () => {
        await increaseTime(oneWeek);
        await tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(2)));
        expect(await mbContract.balanceOf(buyer1.address)).to.be.equal(ONEK_MBF.mul(BigNumber.from(10)));
      });

      it("0% left", async () => {
        expect(await tokenSaleContract.withdrawableBalance(buyer1.address)).to.be.equal(BigNumber.from(0));
        await expect(
          tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.mul(BigNumber.from(1))),
        ).to.be.revertedWith("Sale: insufficient balance");
      });
    });
  });

  describe("when not reached the softcap", function () {
    let snapshotID: any;
    before(async () => {
      snapshotID = await getSnapShot();
    });
    after(async () => {
      await revertEvm(snapshotID);
    });

    it("buyTokens", async () => {
      const timenow = await getTimeStamp();

      await increaseTime(starTime - timenow);
      await tokenSaleContract.connect(buyer1).buyTokens(buyer1.address, { value: ether(1) });
    });

    it("sale end, withdrawTokens failed", async () => {
      await increaseTime(tokenSaleDuration);
      await mbContract.connect(owner).transfer(tokenSaleContract.address, hardcap);
      await tokenSaleContract.connect(owner).release();
      await expect(
        tokenSaleContract.connect(buyer1).withdrawTokens(ONEK_MBF.div(BigNumber.from(5))),
      ).to.be.revertedWith("Sale: softcap not reached");
    });

    it("withdrawBNBWhenFailed", async () => {
      const balanceBefore = await ethers.provider.getBalance(tokenSaleContract.address);
      await tokenSaleContract.connect(buyer1).withdrawBNBWhenFailed();
      const balanceAfter = await ethers.provider.getBalance(tokenSaleContract.address);
      expect(balanceBefore.sub(balanceAfter)).to.equal(ether(1));
      expect(await tokenSaleContract.balanceOf(buyer1.address)).to.equal(BigNumber.from(0));
    });
  });
});
