# Kakarot-Foundry

### Setup

```sh
$ forge install
```

### Contract Example

The contract `SignatureVerifier.sol` tries the ecrecover precompiled contract functionality, which will fork and test on Kakarot Sepolia.

### Test
```sh
$ forge test --fork-url kakarot_starknet_sepolia
```

### Deploy

Give your deployer private key for `PRIVATE_KEY` in the `.env`. Please ensure your deployer address has enough Kakarot Sepolia faucet.

```sh
$ forge script ./script/SignatureVerifier.s.sol --broadcast --rpc-url kakarot_starknet_sepolia
```

### Verify

Please make sure your solidity version and optimizer is set correctly.

> You don't need the `etherscan-api-key` for Kakarot verifying, just give the string `kakarot_starknet_sepolia` for this field.

If the deployed address is `0x1d1688f3CF762fda6E53cb97522487F96edaF1b8`:

```sh
$ forge verify-contract 0x1d1688f3CF762fda6E53cb97522487F96edaF1b8 ./src/SignatureVerifier.sol:SignatureVerifier \
--verifier-url 'https://api.routescan.io/v2/network/testnet/evm/920637907288165/etherscan' \
--etherscan-api-key "kakarot_starknet_sepolia" \
--num-of-optimizations 200 \
--compiler-version "v0.8.26+commit.8a97fa7a"
```