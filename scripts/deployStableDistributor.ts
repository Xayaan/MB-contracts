import { Contract, ContractFactory } from "ethers";
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";
import addresses from "./addresses";

async function main(): Promise<void> {
  const paramAddresses = addresses.networks.bsct;
  // Hardhat always runs the compile task when running scripts through it.
  // If this runs in a standalone fashion you may want to call compile manually
  // to make sure everything is compiled
  // await run("compile");

  // We get the contract to deploy
  const StableDistributor: ContractFactory = await ethers.getContractFactory("StableDistributor");
  const stableDistributor: Contract = await StableDistributor.deploy(
    paramAddresses.busdContract,
    paramAddresses.marketingAccount,
  );

  console.log("StableDistributor deployed to:", stableDistributor.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
