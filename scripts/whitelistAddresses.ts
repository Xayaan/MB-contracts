import { Contract, ContractFactory } from "ethers";
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";
import addresses from "./addresses";
import { whitelist } from "./whitelist";

const chain = "bsc";

async function main(): Promise<void> {
  const [owner] = await ethers.getSigners();
  const paramAddresses = addresses.networks[chain];

  // We get the contract to deploy
  const SaleContract: ContractFactory = await ethers.getContractFactory("MoonBearTokenSale");
  const saleContract: Contract = SaleContract.attach(paramAddresses.saleContract);

  await saleContract.connect(owner).addToWhitelist(whitelist);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
