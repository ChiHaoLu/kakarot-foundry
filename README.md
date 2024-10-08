# Kakarot-Foundry

### Setup

```sh
$ forge install
```

### Contract Example

The contract `SignatureVerifier.sol` tries the ecrecover precompiled contract functionality, which will fork and test on Kakarot Sepolia.

### Test
```sh
$ forge test --fork-url kakarot_sepolia
```

### Deploy

Give your deployer private key for `PRIVATE_KEY` in the `.env`. Please ensure your deployer address has enough Kakarot Sepolia faucet.

```sh
$ forge script ./script/SignatureVerifier.s.sol --broadcast --rpc-url kakarot_sepolia
```

### Verify

Please make sure your solidity version and optimizer is set correctly.

> You don't need the `etherscan-api-key` for Kakarot verifying, just give the string `kakarot_sepolia` for this field.

If the deployed address is `0x99682dAc0D03F0D12392dCE0B0E34f4AaD0b56E1`:

```sh
$ forge verify-contract 0x99682dAc0D03F0D12392dCE0B0E34f4AaD0b56E1 ./src/SignatureVerifier.sol:SignatureVerifier \
--verifier-url 'https://api.routescan.io/v2/network/testnet/evm/1802203764_2/etherscan' \
--etherscan-api-key "kakarot_sepolia" \
--num-of-optimizations 200 \
--compiler-version "v0.8.26+commit.8a97fa7a"
>
Start verifying contract `0x99682dAc0D03F0D12392dCE0B0E34f4AaD0b56E1` deployed on kakarot-sepolia

Submitting verification for [src/SignatureVerifier.sol:SignatureVerifier] 0x99682dAc0D03F0D12392dCE0B0E34f4AaD0b56E1.
Submitted contract for verification:
        Response: `OK`
        GUID: `7e88936a-fe91-5599-9ede-cc19ba05dda9`
        URL: https://sepolia.kakarotscan.org/address/0x99682dac0d03f0d12392dce0b0e34f4aad0b56e1
```
