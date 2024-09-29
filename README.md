## Kakarot-Foundry

### Test
```sh
$ forge test --fork-url kakarot_sepolia
```

### Deploy and Verify

```sh
$ forge script ./script/SignatureVerifier.s.sol --broadcast --rpc-url kakarot_sepolia

# If your deployed address is `0x99682dAc0D03F0D12392dCE0B0E34f4AaD0b56E1`
$ forge verify-contract 0x99682dAc0D03F0D12392dCE0B0E34f4AaD0b56E1 ./src/SignatureVerifier.sol:SignatureVerifier \
--verifier-url 'https://api.routescan.io/v2/network/testnet/evm/1802203764_2/etherscan' \
--etherscan-api-key "kakarot_sepolia" \
--num-of-optimizations 200 \
--compiler-version "v0.8.26+commit.8a97fa7a"
```
