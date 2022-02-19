import { Contract, ContractFactory } from "ethers";
// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import hre, { ethers } from "hardhat";

function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function main(): Promise<void> {
  // Hardhat always runs the compile task when running scripts through it.
  // If this runs in a standalone fashion you may want to call compile manually
  // to make sure everything is compiled
  // await run("compile");

  // We get the contract to deploy

  // construction params
  const token = "0x8f37878dCe06307d66596b8f275f777A45434A83"; // $MBF token address
  const salePrice = 3; // BNB per token, multiplied by 1e9
  const startTime = 1628234711; // sale start time in unix sec
  const softCap = "250000000000000000000"; // token amount to sell ( 250 * 1e9 * 1e9 )
  const hardCap = "500000000000000000000"; // token amount to sell ( 500 * 1e9 * 1e9 )
  const tokenSaleDuration = 86400 * 3; // sale duration (3 days)
  const maxPurchaseAmount = ethers.utils.parseEther("5"); // Max purchase amount (5BNB)
  const MoonBearTokenSale: ContractFactory = await ethers.getContractFactory("MoonBearTokenSale");
  const moonBearTokenSale: Contract = await MoonBearTokenSale.deploy(
    token,
    softCap,
    hardCap,
    salePrice,
    startTime,
    tokenSaleDuration,
    maxPurchaseAmount,
  );
  await moonBearTokenSale.deployed();

  console.log("MoonBearTokenSale deployed to:", moonBearTokenSale.address);

  // Wait for 60s before verification (recommended by bsc)
  await sleep(60000);

  await hre.run("verify:verify", {
    address: moonBearTokenSale.address,
    constructorArguments: [token, softCap, hardCap, salePrice, startTime, tokenSaleDuration, maxPurchaseAmount],
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
