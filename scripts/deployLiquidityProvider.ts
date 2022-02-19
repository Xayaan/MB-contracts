import { Contract, ContractFactory } from "ethers";
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";
import addresses from "./addresses";

async function main(): Promise<void> {
  const paramAddresses = addresses.networks.bsc;
  // Hardhat always runs the compile task when running scripts through it.
  // If this runs in a standalone fashion you may want to call compile manually
  // to make sure everything is compiled
  // await run("compile");

  // We get the contract to deploy
  const AddLiquidity: ContractFactory = await ethers.getContractFactory("AddLiquidity");
  const addLiquidity: Contract = await AddLiquidity.deploy(
    paramAddresses.tokenContractProxy,
    paramAddresses.swapRouter,
  );

  console.log("AddLiquidity deployed to:", addLiquidity.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
