# TokenSwap Contract

The TokenSwap contract is a smart contract designed to facilitate the swapping of ERC1155 tokens between two parties. It allows the exchange of tokens between the owners of the two different ERC1155 tokens.

## Contract Details

- **Name:** TokenSwap Contract

## Features

The TokenSwap Contract includes the following features:

- **Token Swapping**: Owners of two different ERC1155 tokens can swap tokens with each other.
- **Ownership Control**: The contract ensures that only the owners of the tokens can initiate the swaps.
- **Balance Verification**: Checks are in place to ensure that the owners have sufficient balances of the respective tokens.
- **Security**: Unauthorized users are not allowed to initiate swaps.

## Getting Started

To use the TokenSwap Contract in your project, you need to deploy it with the addresses of the two ERC1155 tokens and the addresses of their respective owners.

## Usage

The TokenSwap Contract provides the following function for token swapping:

### Swap Tokens

Owners of the two ERC1155 tokens can swap tokens using the `swap` function. The function requires two parameters:

- `_tokenId1`: The identifier of the token to be swapped by owner1.
- `_tokenId2`: The identifier of the token to be swapped by owner2.

Example usage:

```solidity
tokenSwapContract.swap(tokenId1, tokenId2);
```

The function ensures that the sender is either `owner1` or `owner2` and that they have sufficient balances of the respective tokens to initiate the swap.

