# moonbear-contracts

Deployment Instructions:

1. duplicate `.env.example` and rename to `.env`
2. copy and paste your MNEMONIC key into `.env` file
3. deploy moonbear: `npx hardhat run scripts/deployMoonBear.ts --network bsct`
4. deploy stable distributor: `npx hardhat run scripts/deployStableDistributor.ts --network bsct`
5. deploy team distributor: `npx hardhat run scripts/deployTeamDistributor.ts --network bsct`
6. update token sale token address in token sale script
7. deploy token sale: `npx hardhat run scripts/deployTokenSale.ts --network bsct`
8. verify all deployed addresses:
   - `npx hardhat verify --network bsct 0xc4d9967aa8f1bd0432c58a7b740b2d5bde0ff398`
   - `npx hardhat verify --contract contracts/proxy/AdminUpgradeabilityProxy.sol:AdminUpgradeabilityProxy --network bsct 0xc4d9967aa8f1bd0432c58a7b740b2d5bde0ff398`
   - `npx hardhat verify --contract contracts/MoonBear.sol:MoonBear --network bsct 0x7fd3d9f5ac1c283ee2c889748e9d10192eec5c8b`
   - `npx hardhat verify --contract contracts/StableDistributor.sol:StableDistributor --network bsct 0x2CC9f34Bccf5D3a4F279F8F5bAC8904d16a34f5E "0x78867bbeef44f2326bf8ddd1941a4439382ef2a7" "0xf1306fa93d223ea84b100bd59633bfdcdf617a67"`
   - `npx hardhat verify --contract contracts/TeamDistributor.sol:TeamDistributor --network bsct 0xa4dA8bDaB9698c1591b698015DeF25d42142705e "0x78867bbeef44f2326bf8ddd1941a4439382ef2a7" "0x710Eb6D5550F1039579fbBf1183EA70B88ad14B5"`
   - `npx hardhat verify --contract contracts/TokenSale.sol:MoonBearTokenSale --network bsct 0x5231f8C2D49E2087F3daA333708E3960820FC174 "0xc4d9967aa8f1bd0432c58a7b740b2d5bde0ff398" "3000000000" "6000000000" "3" "1627556100" "86400"`

(this will deploy contract to the bsc testnet; to deploy on mainnet, just change bsct to bsc)

Post Deployment Instructions:

- Account 1 = Deployer
- Account 2 = Dev/Marketing
- Account 3 = Staking Rewards (Temporary)
- Account 4 = Charity Donations
- Account 5 = Buyback Wallet
- Account 6 = Team (Base Account)

- Verify proxy contract: https://testnet.bscscan.com/proxyContractChecker?a=0xc4d9967aa8f1bd0432c58a7b740b2d5bde0ff398

- Call MoonBear.setStableWallet(stableDistributor.address) (via proxy)
- Call MoonBear.setBuybackWallet(buybackAddress) (via proxy)
- Call StableDistributor.addMember(stakingAddress)
- Call StableDistributor.addMember(charityAddress)
- Call StableDistributor.addMember(teamDistributor.address)
- Call StableDistributor.addMember(marketing.address)
- Call TeamDistributor.addMember(memberAddress) (for each team member)

BSC Testnet Deployment:

- MoonBear Token/Proxy: https://testnet.bscscan.com/address/0xc4d9967aa8f1bd0432c58a7b740b2d5bde0ff398
- MoonBear Contract: https://testnet.bscscan.com/address/0x7fd3d9f5ac1c283ee2c889748e9d10192eec5c8b
- Stable Distributor: https://testnet.bscscan.com/address/0x2CC9f34Bccf5D3a4F279F8F5bAC8904d16a34f5E
- Team Distributor: https://testnet.bscscan.com/address/0xa4dA8bDaB9698c1591b698015DeF25d42142705e
- Token Sale Contract: https://testnet.bscscan.com/address/0xb9d87bec7d92fF7E38771045215abB6cB95e36cc
