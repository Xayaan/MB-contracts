import { Contract, ContractFactory } from "ethers";
import { ethers, upgrades, run } from "hardhat";
import addresses from "./addresses";

const chain = "bsct";

function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function main(): Promise<void> {
  const [owner] = await ethers.getSigners();
  const paramAddresses = addresses.networks[chain];

  // MoonBear
  const MoonBear: ContractFactory = await ethers.getContractFactory("MoonBear");
  const moonBearProxy: Contract = await upgrades.deployProxy(MoonBear, [
    paramAddresses.swapRouter,
    paramAddresses.busdContract,
  ]);
  await moonBearProxy.deployed();

  console.log("MoonBear deployed to:", moonBearProxy.address);

  // StableDistributor
  const StableDistributor: ContractFactory = await ethers.getContractFactory("StableDistributor");
  const stableDistributor: Contract = await StableDistributor.deploy(
    paramAddresses.busdContract,
    paramAddresses.stableBase,
  );
  await stableDistributor.deployed();

  console.log("StableDistributor deployed to:", stableDistributor.address);

  // TeamDistributor
  const TeamDistributor: ContractFactory = await ethers.getContractFactory("TeamDistributor");
  const teamDistributor: Contract = await TeamDistributor.deploy(
    paramAddresses.busdContract,
    paramAddresses.teamAccount,
  );
  await teamDistributor.deployed();

  console.log("TeamDistributor deployed to:", teamDistributor.address);

  await sleep(5000);

  // Set stableWallet
  console.log("Setting stableWallet addresses:");
  await moonBearProxy.connect(owner).setStableWallet(stableDistributor.address);
  await moonBearProxy.connect(owner).setBuybackWallet(paramAddresses.buybackAccount);

  // StableDistributor members
  console.log("Setting stableDistributor addresses:");
  await stableDistributor.connect(owner).addMember(paramAddresses.stakingAccount, 30); // 30%
  await stableDistributor.connect(owner).addMember(paramAddresses.marketingAccount, 30); // 30%
  await stableDistributor.connect(owner).addMember(paramAddresses.charityAccount, 20); // 20%
  await stableDistributor.connect(owner).addMember(teamDistributor.address, 20); // 20%

  // Wait for 60s before verification (recommended by bsc)
  await sleep(60000);
  // Verify contracts
  // StableDistributor
  await run("verify:verify", {
    contract: "contracts/StableDistributor.sol:StableDistributor",
    address: stableDistributor.address,
    constructorArguments: [paramAddresses.busdContract, paramAddresses.stableBase],
  });

  // TeamDistributor
  await run("verify:verify", {
    contract: "contracts/TeamDistributor.sol:TeamDistributor",
    address: teamDistributor.address,
    constructorArguments: [paramAddresses.busdContract, paramAddresses.teamAccount],
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
