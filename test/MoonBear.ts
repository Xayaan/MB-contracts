import { ZERO_ADDRESS } from "./utils/constants";
import hre, { ethers, upgrades } from "hardhat";
import { Artifact } from "hardhat/types";
import { Signer } from "ethers";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/dist/src/signer-with-address";
import { BigNumber } from "@ethersproject/bignumber";
import { expect } from "chai";

import { MoonBear } from "../typechain/MoonBear";
import { IUniswapV2Factory } from "../typechain/IUniswapV2Factory";
import { IUniswapV2Router02 } from "../typechain/IUniswapV2Router02";
import { IWETH } from "./../typechain/IWETH";
import { IERC20 } from "../typechain";

import { ether, getSnapShot, revertEvm, MAX_UINT_256 } from "./utils";

describe("MoonBear Test", () => {
  let owner: SignerWithAddress;
  let alice: SignerWithAddress;
  let bob: SignerWithAddress;
  let bill: SignerWithAddress;
  let hotWallet: SignerWithAddress;
  let stableWallet: SignerWithAddress;
  let cexUser: SignerWithAddress;

  let mbContract: MoonBear;
  let uniswapFactory: IUniswapV2Factory;
  let uniswapRouter: IUniswapV2Router02;
  let wEth: IWETH;
  let pair: IERC20;
  const UNISWAP_ROUTER_ADDRESS = "0x7a250d5630b4cf539739df2c5dacb4c659f2488d";
  const UNISWAP_FACTORY_ADDRESS = "0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f";
  const WETH_ADDRESS = "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2";
  const USDT_ADDRESS = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
  const ONE_MBF = "000000000";

  let aliceBal: BigNumber;
  let bobBal: BigNumber;
  let billBal: BigNumber;

  before(async () => {
    const signers: SignerWithAddress[] = await hre.ethers.getSigners();

    owner = signers[0];
    alice = signers[1];
    bob = signers[2];
    bill = signers[3];
    stableWallet = signers[4];
    hotWallet = signers[5];
    cexUser = signers[6];

    const mbArtifact = await ethers.getContractFactory("MoonBear");
    mbContract = <MoonBear>await upgrades.deployProxy(mbArtifact, [UNISWAP_ROUTER_ADDRESS, USDT_ADDRESS]);

    const factoryArtifact: Artifact = await hre.artifacts.readArtifact("IUniswapV2Factory");
    uniswapFactory = <IUniswapV2Factory>await ethers.getContractAt(factoryArtifact.abi, UNISWAP_FACTORY_ADDRESS);
    const routerArtifact: Artifact = await hre.artifacts.readArtifact("IUniswapV2Router02");
    uniswapRouter = <IUniswapV2Router02>await ethers.getContractAt(routerArtifact.abi, UNISWAP_ROUTER_ADDRESS);
    const wethArtifact: Artifact = await hre.artifacts.readArtifact("IWETH");
    wEth = <IWETH>await ethers.getContractAt(wethArtifact.abi, WETH_ADDRESS);
    const erc20Artifact: Artifact = await hre.artifacts.readArtifact("IERC20");
    const pairAddress = await mbContract.bnbPair();
    pair = <IERC20>await ethers.getContractAt(erc20Artifact.abi, pairAddress);

    await wEth.connect(owner).deposit({ value: ether("1000") });
    await wEth.connect(owner).approve(uniswapRouter.address, MAX_UINT_256);
    await mbContract.connect(owner).approve(uniswapRouter.address, MAX_UINT_256);
    await mbContract.connect(alice).approve(uniswapRouter.address, MAX_UINT_256);
    await mbContract.connect(bill).approve(uniswapRouter.address, MAX_UINT_256);
    await mbContract.connect(bob).approve(uniswapRouter.address, MAX_UINT_256);
    await pair.connect(owner).approve(uniswapRouter.address, MAX_UINT_256);
  });

  describe("owner functions", async () => {
    beforeEach(async () => {});

    it("pause", async () => {
      await mbContract.connect(owner).pause();
      expect(await mbContract.paused()).to.be.equal(true);
    });

    it("unpause", async () => {
      await mbContract.connect(owner).unpause();
      expect(await mbContract.paused()).to.be.equal(false);
    });

    it("excludeFromReward", async () => {
      await mbContract.connect(owner).excludeFromReward(alice.address);
      expect(await mbContract.isExcludedFromReward(alice.address)).to.be.equal(true);
    });

    it("includeInReward", async () => {
      await mbContract.connect(owner).includeInReward(alice.address);
      expect(await mbContract.isExcludedFromReward(alice.address)).to.be.equal(false);
    });

    it("excludeFromFee", async () => {
      await mbContract.connect(owner).excludeFromFee(alice.address);
      expect(await mbContract.isExcludedFromFee(alice.address)).to.be.equal(true);
    });

    it("includeInFee", async () => {
      await mbContract.connect(owner).includeInFee(alice.address);
      expect(await mbContract.isExcludedFromFee(alice.address)).to.be.equal(false);
    });

    it("setStableWallet", async () => {
      await mbContract.connect(owner).setStableWallet(stableWallet.address);
      expect(await mbContract.stableWallet()).to.be.equal(stableWallet.address);
    });

    it("excludeFromMaxTxLimit", async () => {
      await mbContract.connect(owner).excludeFromMaxTxLimit(alice.address);
      expect(await mbContract.isExcludedFromMaxTxLimit(alice.address)).to.be.equal(true);
    });

    it("includeInMaxTxLimit", async () => {
      await mbContract.connect(owner).includeInMaxTxLimit(alice.address);
      expect(await mbContract.isExcludedFromMaxTxLimit(alice.address)).to.be.equal(false);
    });
  });

  describe("add liquidity", async () => {
    it("should add liquidity", async () => {
      await uniswapRouter.connect(owner).addLiquidity(
        mbContract.address,
        WETH_ADDRESS,
        "1000000000000000000", // 1,000,000,000 MBF
        ether("1000"), // 1000 ETH, 1 ETH = 1000000 MBF
        0,
        0,
        owner.address,
        Date.now() * 2,
      );
    });
  });

  describe("fee system", async () => {
    let snapshotId: string;

    before(async () => {
      snapshotId = await getSnapShot();
    });

    after(async () => {
      await revertEvm(snapshotId);
    });

    it("fee whitelist", async () => {
      await mbContract.connect(owner).addToTaxWhitelist([alice.address]);
      expect(await mbContract.taxWhitelist(alice.address)).to.be.equal(true);
    });

    it("no fee for transfer to alice", async () => {
      await mbContract.connect(owner).transfer(alice.address, "100000000000000");
      expect(await mbContract.balanceOf(alice.address)).to.be.equal("100000000000000");
    });

    it("apply fee for transfer from alice to bob", async () => {
      await mbContract.connect(alice).transfer(bob.address, "10000000000000");
      expect(await mbContract.balanceOf(bob.address)).to.lt("100000000000000");
    });

    it("bill should buy with no fee, whitelist bill", async () => {
      let buyAmount = "100000" + ONE_MBF;

      await uniswapRouter
        .connect(bill)
        .swapETHForExactTokens(buyAmount, [WETH_ADDRESS, mbContract.address], bill.address, Date.now() * 2, {
          value: ether(2),
        });

      expect(await mbContract.balanceOf(bill.address)).to.be.equal(BigNumber.from(buyAmount));
      expect(await mbContract.taxWhitelist(bill.address)).to.be.equal(true);
    });

    it("should add hot wallets", async () => {
      await mbContract.addToHotWallets([hotWallet.address]);
      expect(await mbContract.hotWallets(hotWallet.address)).to.be.equal(true);
    });

    it("no fee from hot wallet to ", async () => {
      await mbContract.connect(owner).transfer(hotWallet.address, "100000000000000");
      expect(await mbContract.balanceOf(hotWallet.address)).to.be.equal("100000000000000");

      await mbContract.connect(hotWallet).transfer(cexUser.address, "100000000000000");
      expect(await mbContract.balanceOf(cexUser.address)).to.be.equal("100000000000000");
    });
  });

  describe("buy", async () => {
    let buyAmount = "100000" + ONE_MBF;

    it("buy failed when paused", async () => {
      await mbContract.connect(owner).pause();
      expect(await mbContract.paused()).to.be.equal(true);

      await expect(
        uniswapRouter
          .connect(alice)
          .swapETHForExactTokens(buyAmount, [WETH_ADDRESS, mbContract.address], alice.address, Date.now() * 2, {
            value: ether(2),
          }),
      ).to.be.reverted;

      await mbContract.connect(owner).unpause();
    });

    it("alice should buy without fee", async () => {
      await uniswapRouter
        .connect(alice)
        .swapETHForExactTokens(buyAmount, [WETH_ADDRESS, mbContract.address], alice.address, Date.now() * 2, {
          value: ether(2),
        });

      expect(await mbContract.balanceOf(alice.address)).to.be.equal(BigNumber.from(buyAmount));
    });

    it("bob should buy without fee", async () => {
      await uniswapRouter
        .connect(bob)
        .swapETHForExactTokens(buyAmount, [WETH_ADDRESS, mbContract.address], bob.address, Date.now() * 2, {
          value: ether(2),
        });

      expect(await mbContract.balanceOf(bob.address)).to.be.equal(BigNumber.from(buyAmount));
    });

    it("bill should buy without fee", async () => {
      await uniswapRouter
        .connect(bill)
        .swapETHForExactTokens(buyAmount, [WETH_ADDRESS, mbContract.address], bill.address, Date.now() * 2, {
          value: ether(2),
        });

      expect(await mbContract.balanceOf(bill.address)).to.be.equal(BigNumber.from(buyAmount));
    });
  });

  describe("sell", async () => {
    let sellAmount = BigNumber.from("100000" + ONE_MBF);
    let feeAmountOnSell = BigNumber.from("14000" + ONE_MBF);
    let taxOnOneSell = BigNumber.from("2000" + ONE_MBF);
    let burnOnOneSell = BigNumber.from("2000" + ONE_MBF);
    let totalSupply = BigNumber.from("1000000000000" + ONE_MBF);
    const reflection = burnOnOneSell.mul(feeAmountOnSell).div(totalSupply);

    it("alice should sell with fee", async () => {
      await uniswapRouter
        .connect(alice)
        .swapExactTokensForTokensSupportingFeeOnTransferTokens(
          sellAmount,
          0,
          [mbContract.address, wEth.address],
          alice.address,
          Date.now() * 2,
        );

      expect(await mbContract.totalFees()).to.equal(taxOnOneSell);
      expect(await mbContract.balanceOf(mbContract.address)).to.equal(feeAmountOnSell.add(reflection));
      expect(await mbContract.totalSupply()).to.equal(totalSupply.sub(burnOnOneSell));
      totalSupply = totalSupply.sub(burnOnOneSell);
    });

    it("bob should sell with fee", async () => {
      await uniswapRouter
        .connect(bob)
        .swapExactTokensForTokensSupportingFeeOnTransferTokens(
          sellAmount,
          0,
          [mbContract.address, wEth.address],
          bob.address,
          Date.now() * 2,
        );

      expect(await mbContract.totalFees()).to.equal(taxOnOneSell.mul(2));
      expect(await mbContract.balanceOf(mbContract.address)).to.equal(feeAmountOnSell.mul(2).add(reflection.mul(3)));
      expect(await mbContract.totalSupply()).to.equal(totalSupply.sub(burnOnOneSell));
      totalSupply = totalSupply.sub(burnOnOneSell);
    });
  });
});
