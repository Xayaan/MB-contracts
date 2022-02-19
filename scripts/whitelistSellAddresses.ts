import { Contract, ContractFactory } from "ethers";
import { chunk } from "lodash";
import { ethers } from "hardhat";
import addresses from "./addresses";
import { whitelist } from "./whitelist";

const chain = "bsc";

async function main(): Promise<void> {
  const [owner] = await ethers.getSigners();
  const paramAddresses = addresses.networks[chain];

  // We get the contract to deploy
  const TokenContract: ContractFactory = await ethers.getContractFactory("MoonBear");
  const tokenProxyContract: Contract = TokenContract.attach(paramAddresses.tokenContractProxy);
  const currentNonce = await owner.getTransactionCount();
  const chunks = chunk(whitelist, 250);
  await Promise.all(
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    chunks.map(async (whitelistChunk: any, i) => {
      console.log("file: whitelistSellAddresses.ts ~ line 24 ~ chunk ~ whitelistChunk", whitelistChunk);
      await tokenProxyContract.connect(owner).addToTaxWhitelist(whitelistChunk, { nonce: currentNonce + i });
    }),
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
