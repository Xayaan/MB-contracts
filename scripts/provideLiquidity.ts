import { Contract } from "ethers";
import { ethers, artifacts } from "hardhat";
import addresses from "./addresses";
// import IRouter from "../contracts/interfaWETHces/IUniswapV2Router.sol";
// import IFactory from "../contracts/interfaces/IUniswapV2Factory.sol";

const chain = "bsc";
const liquidityToProvide = {
  mbf: "100000000000000000000", // 100.000.000.000
  BNB: "300000000000000000000", // 300e18 -> 300BNB
};

async function main(): Promise<void> {
  const paramAddresses = addresses.networks[chain];

  const addLiquidity: Contract = (await ethers.getContractFactory("AddLiquidity")).attach(
    paramAddresses.liquidityProvider,
  );

  // Add liquidity
  const liquidityTx = await addLiquidity.addToPair(liquidityToProvide.mbf, liquidityToProvide.BNB);
  await liquidityTx.wait();

  console.log("Liquidity Provided");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
