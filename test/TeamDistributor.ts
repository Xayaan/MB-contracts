import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import chai from "chai";
import { deployContract, solidity } from "ethereum-waffle";
import hre, { ethers } from "hardhat";
import { Artifact } from "hardhat/types";
import { ERC20, TeamDistributor } from "../typechain";

import { ADDRESS_ZERO, ONE, ether, wei, ZERO, ZERO_ADDRESS } from "./utils";

const { expect } = chai;

chai.use(solidity);

describe("TeamDistributor", function () {
  let teamDistributor: TeamDistributor;
  let token: ERC20;

  let owner: SignerWithAddress;
  let testUser1: SignerWithAddress;
  let testUser2: SignerWithAddress;
  let testUser3: SignerWithAddress;
  let testUser4: SignerWithAddress;
  let testUser5: SignerWithAddress;
  let baseUser: SignerWithAddress;

  before(async function () {
    const accounts = await ethers.getSigners();
    owner = accounts[0];
    testUser1 = accounts[1];
    testUser2 = accounts[2];
    testUser3 = accounts[3];
    testUser4 = accounts[4];
    testUser5 = accounts[5];
    baseUser = accounts[7];

    const ERC20Artifact: Artifact = await hre.artifacts.readArtifact("TestToken");
    const teamDistributorArtifact = await hre.artifacts.readArtifact("TeamDistributor");

    token = <ERC20>await deployContract(owner, ERC20Artifact);
    teamDistributor = <TeamDistributor>(
      await deployContract(owner, teamDistributorArtifact, [token.address, baseUser.address])
    );
  });

  describe("Check Basic Configuration", function () {
    it("Check totalAllocation", async function () {
      const totalAllocation = await teamDistributor.totalAllocation();
      expect(totalAllocation).to.equal(wei(1000));
    });

    it("Check token", async function () {
      const tokenAddress = await teamDistributor.token();
      expect(tokenAddress).to.equal(token.address);
    });

    it("Check baseAccount", async function () {
      const baseAccount = await teamDistributor.baseAccount();
      expect(baseAccount).to.equal(baseUser.address);
    });

    it("Check totalReleased", async function () {
      const totalReleased = await teamDistributor.totalReleased();
      expect(totalReleased).to.equal(ZERO);
    });

    it("Check totalDistributed", async function () {
      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ZERO);
    });

    it("Check allocationSum", async function () {
      const allocationSum = await teamDistributor.allocationSum();
      expect(allocationSum).to.equal(ZERO);
    });

    it("Check baseAccount info using getMemberInfo", async function () {
      const baseAccountInfo = await teamDistributor.getMemberInfo(baseUser.address);
      expect(baseAccountInfo[0]).to.equal(baseUser.address);
      expect(baseAccountInfo[1]).to.equal(wei("1000"));
      expect(baseAccountInfo[2]).to.equal(ZERO);
      expect(baseAccountInfo[3]).to.equal(ZERO);
    });

    it("Check totalMembers", async function () {
      const totalMembers = await teamDistributor.getTotalMembers();
      expect(totalMembers).to.equal(ONE);
    });

    it("Check baseAccount info using getMemberInfoAtIndex", async function () {
      const baseAccountInfo = await teamDistributor.getMemberInfoAtIndex(0);
      expect(baseAccountInfo[0]).to.equal(baseUser.address);
      expect(baseAccountInfo[1]).to.equal(wei("1000"));
      expect(baseAccountInfo[2]).to.equal(ZERO);
      expect(baseAccountInfo[3]).to.equal(ZERO);
    });
  });

  describe("Try functions", function () {
    it("Try release", async function () {
      await expect(teamDistributor.connect(testUser2).release()).to.be.revertedWith("Member doesn't exist!");
    });
  });

  describe("Send some token and check", function () {
    it("Send Token to wallet", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
      const balance = await token.balanceOf(teamDistributor.address);
      expect(balance).to.equal(ether("100"));
    });

    it("Distribute Token and check values", async function () {
      await teamDistributor.updatePendingAmounts();
      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("100"));

      const baseAccountInfo = await teamDistributor.getMemberInfo(baseUser.address);
      expect(baseAccountInfo[2]).to.equal(ether("100"));
    });
  });

  describe("Send some tokens, and add  members", function () {
    it("Send token", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
    });

    it("Add a  member", async function () {
      await teamDistributor.addMember(testUser1.address, 100); // 10%
    });

    it("check values of added  member", async function () {
      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("200"));

      const baseAccountInfo = await teamDistributor.getMemberInfo(baseUser.address);
      expect(baseAccountInfo[2]).to.equal(ether("200"));

      const account1 = await teamDistributor.getMemberInfo(testUser1.address);
      expect(account1[0]).to.equal(testUser1.address);
      expect(account1[1]).to.equal(wei(100));
      expect(account1[2]).to.equal(ZERO);
      expect(account1[3]).to.equal(ZERO);
    });

    it("Send token", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
    });

    it("getReleasableAmount", async function () {
      await expect(teamDistributor.getReleasableAmount(testUser3.address)).to.be.revertedWith("Member doesn't exist!");

      const releasable1 = await teamDistributor.getReleasableAmount(testUser1.address);
      expect(releasable1).to.equal(ether("10"));

      const releasableBase = await teamDistributor.getReleasableAmount(baseUser.address);
      expect(releasableBase).to.equal(ether("290"));
    });

    it("Add a  member", async function () {
      await teamDistributor.addMember(testUser2.address, 200); // 20%
    });

    it("check values of added member", async function () {
      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("300"));

      const baseAccountInfo = await teamDistributor.getMemberInfo(baseUser.address);
      expect(baseAccountInfo[2]).to.equal(ether("290"));

      const account1 = await teamDistributor.getMemberInfo(testUser1.address);
      expect(account1[2]).to.equal(ether("10"));

      const account2 = await teamDistributor.getMemberInfo(testUser2.address);
      expect(account2[0]).to.equal(testUser2.address);
      expect(account2[1]).to.equal(wei(200));
      expect(account2[2]).to.equal(ZERO);
      expect(account2[3]).to.equal(ZERO);
    });

    it("Send token", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
    });

    it("check addMember validation", async function () {
      await expect(teamDistributor.addMember(testUser1.address, 10)).to.be.revertedWith("Member already exist!");
      await expect(teamDistributor.addMember(ZERO_ADDRESS, 10)).to.be.revertedWith(
        "Member address can't be empty address",
      );
      await expect(teamDistributor.addMember(testUser4.address, 0)).to.be.revertedWith("Allocation can't be zero!");
      await expect(teamDistributor.addMember(testUser4.address, 1000)).to.be.revertedWith("Allocation is too big!");
    });
  });

  describe("release tokens", function () {
    it("Release from TestUser1 and check Config", async function () {
      await teamDistributor.connect(testUser1).release();
      const balance = await token.balanceOf(teamDistributor.address);
      expect(balance).to.equal(ether("380"));

      const balance1 = await token.balanceOf(testUser1.address);
      expect(balance1).to.equal(ether("20"));

      const totalReleased = await teamDistributor.totalReleased();
      expect(totalReleased).to.equal(ether("20"));

      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("400"));

      const allocationSum = await teamDistributor.allocationSum();
      expect(allocationSum).to.equal(wei(300));
    });
  });

  describe("send token and release again", function () {
    it("Send token", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
    });

    it("Release from TestUser1 and check Config", async function () {
      await teamDistributor.connect(testUser1).release();
      const balance = await token.balanceOf(teamDistributor.address);
      expect(balance).to.equal(ether("470"));

      const balance1 = await token.balanceOf(testUser1.address);
      expect(balance1).to.equal(ether("30"));

      const totalReleased = await teamDistributor.totalReleased();
      expect(totalReleased).to.equal(ether("30"));

      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("500"));
    });
  });

  describe("check updateMember address and allocation", function () {
    it("update Address", async function () {
      await expect(teamDistributor.connect(testUser1).updateMemberAddress(ADDRESS_ZERO)).to.be.revertedWith(
        "New address can't be a ZERO address!",
      );
      await expect(teamDistributor.connect(testUser3).updateMemberAddress(testUser1.address)).to.be.revertedWith(
        "You're not a member!",
      );
      await expect(teamDistributor.connect(testUser1).updateMemberAddress(baseUser.address)).to.be.revertedWith(
        "NewAddr already exist!",
      );
      await teamDistributor.connect(testUser1).updateMemberAddress(testUser3.address);
    });

    it("update Allocation", async function () {
      await expect(teamDistributor.updateMemberAllocation(testUser1.address, wei(100))).to.be.revertedWith(
        "Member is not a member!",
      );
      await expect(teamDistributor.updateMemberAllocation(testUser3.address, wei(0))).to.be.revertedWith(
        "Allocation can't be ZERO!",
      );
      await expect(teamDistributor.updateMemberAllocation(testUser3.address, wei(810))).to.be.revertedWith(
        "Allocation is too big!",
      );
      await teamDistributor.updateMemberAllocation(testUser3.address, wei(200));
    });

    it("Check baseAccount info using getMemberInfo", async function () {
      const baseAccountInfo = await teamDistributor.getMemberInfo(baseUser.address);

      expect(baseAccountInfo[1]).to.equal(wei("600"));
    });

    it("Check baseAccount info using getMemberInfoAtIndex", async function () {
      const baseAccountInfo = await teamDistributor.getMemberInfoAtIndex(0);

      expect(baseAccountInfo[1]).to.equal(wei("600"));
    });

    it("check allocationSum", async function () {
      const allocationSum = await teamDistributor.allocationSum();
      expect(allocationSum).to.equal(wei(400));
    });
  });

  describe("remove member", function () {
    it("Send token", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
    });

    it("remove member", async function () {
      await expect(teamDistributor.removeMember(baseUser.address)).to.be.revertedWith("You can't remove baseAccount!");
      await expect(teamDistributor.removeMember(testUser5.address)).to.be.revertedWith("Member doesn't exist!");

      await teamDistributor.removeMember(testUser3.address);
    });

    it("check config after member is removed", async function () {
      const balance = await token.balanceOf(teamDistributor.address);
      expect(balance).to.equal(ether("550"));

      const balance1 = await token.balanceOf(testUser1.address);
      expect(balance1).to.equal(ether("30"));

      const balance3 = await token.balanceOf(testUser3.address);
      expect(balance3).to.equal(ether("20"));

      const totalReleased = await teamDistributor.totalReleased();
      expect(totalReleased).to.equal(ether("50"));

      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("600"));
    });
  });

  describe("Release from other wallets", function () {
    it("Send token", async function () {
      await token.transfer(teamDistributor.address, ether("100"));
    });

    it("getReleasableAmount", async function () {
      await expect(teamDistributor.getReleasableAmount(testUser3.address)).to.be.revertedWith("Member doesn't exist!");

      const releasable2 = await teamDistributor.getReleasableAmount(testUser2.address);
      expect(releasable2).to.equal(ether("80"));

      const releasableBase = await teamDistributor.getReleasableAmount(baseUser.address);
      expect(releasableBase).to.equal(ether("570"));
    });

    it("release some tokens", async function () {
      await teamDistributor.connect(baseUser).release();
      await teamDistributor.connect(testUser2).release();
    });

    it("check values", async function () {
      const balance = await token.balanceOf(teamDistributor.address);
      expect(balance).to.equal(ether("0"));

      const totalReleased = await teamDistributor.totalReleased();
      expect(totalReleased).to.equal(ether("700"));

      const totalDistributed = await teamDistributor.totalDistributed();
      expect(totalDistributed).to.equal(ether("700"));
    });

    it("check baseUserInfo", async function () {
      const userInfo = await teamDistributor.getMemberInfo(baseUser.address);
      expect(userInfo[2]).to.equal(ZERO);
      expect(userInfo[3]).to.equal(ether("570"));

      expect(await token.balanceOf(baseUser.address)).to.equal(ether("570"));
    });

    it("check testUser 2 Info", async function () {
      const userInfo = await teamDistributor.getMemberInfo(testUser2.address);
      expect(userInfo[2]).to.equal(ZERO);
      expect(userInfo[3]).to.equal(ether("80"));

      expect(await token.balanceOf(testUser2.address)).to.equal(ether("80"));
    });
  });
});
