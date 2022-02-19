# MoonBear Launch

1. Deploy new token contract

2. Verify proxy

2.1 https://testnet.bscscan.com/proxyContractChecker?a=

2.2 Change the address in both sale contracts - 0x796e716317c6c05279F9c2b5553F80900D37Ae34 - 0xa76ca3cb418d029bd73bde43e2985ae099cdd138

3. Send 400k tokens to 0x796e716317c6c05279F9c2b5553F80900D37Ae34

3.1 Send 100k tokens to 0xa76ca3cb418d029bd73bde43e2985ae099cdd138

3.2 Set up team distribution

4. Deploy Liquidity Provider contract

4.1 npx hardhat run scripts/deployLiquidityProvider.ts --network bsct

4.2 call excludeFromFee where we will provide liquidity from (contract address)

4.3. Send x amount of tokens to our liquidity contract
4.4. Send x amount of bnb to our liquidity contract

5. Provide liquidity

5.1 npx hardhat run scripts/provideLiquidity.ts --network bsct

6. Call release on 0x796e716317c6c05279F9c2b5553F80900D37Ae34

6.1 Call release on 0xa76ca3cb418d029bd73bde43e2985ae099cdd138
