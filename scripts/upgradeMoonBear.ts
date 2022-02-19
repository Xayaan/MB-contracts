import { ContractFactory } from "ethers";
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers, upgrades, run } from "hardhat";
import addresses from "./addresses";

async function main(): Promise<void> {
  const paramAddresses = addresses.networks.bsc;

  // Full deploy
  // const MoonBear: ContractFactory = await ethers.getContractFactory("MoonBear");
  // const moonBear: Contract = await upgrades.upgradeProxy(paramAddresses.tokenContractProxy, MoonBear);
  // console.log("file: upgradeMoonBear.ts ~ line 20 ~ main ~ moonBear", moonBear);
  // // await moonBear.deployTransaction.wait();
  // await moonBear.deployed();

  // console.log("MoonBear deployed to:", moonBear.address);

  // Safe deploy and then do upgrade using multisig
  const MoonBear: ContractFactory = await ethers.getContractFactory("MoonBear");
  const updatedMoonBearAddress = await upgrades.prepareUpgrade(paramAddresses.tokenContractProxy, MoonBear);
  console.log("file: upgradeMoonBear.ts ~ line 20 ~ main ~ moonBear", updatedMoonBearAddress);
  // await moonBear.deployTransaction.wait();
  // await moonBear.deployed();

  await run("verify:verify", {
    address: `${updatedMoonBearAddress}`,
    // constructorArguments: [paramAddresses.swapRouter, paramAddresses.busdContract],
  });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
