# Airdrop Contract

The Airdrop Contract is a smart contract that allows the owner to distribute ERC1155 tokens to multiple recipients in a controlled manner. This contract is built on the Ethereum blockchain and follows the ERC1155 standard.

## Contract Details

- **Name:** Airdrop Contract

## Features

The Airdrop Contract includes the following features:

- **Token Distribution**: The owner can distribute ERC1155 tokens to multiple addresses.
- **Ownership Control**: The contract is owned by a single address, allowing for control over token distribution.

## Getting Started

To use the Airdrop Contract in your project, you need to deploy it with the address of the ERC1155 token you want to distribute. Here's an example of how to deploy the contract:

```solidity
// Deploy the Airdrop contract with the address of the ERC1155 token
Airdrop airdropContract = new Airdrop(tokenAddress);
```

## Usage

The Airdrop Contract provides a single function for the owner to distribute tokens:

### Distribute Tokens

The `distributeTokens` function allows the owner to send tokens to a recipient. The function takes two parameters:

- `recipient`: The address of the recipient to receive the tokens.
- `tokenId`: The identifier of the ERC1155 token to be distributed.

Here's how to use the `distributeTokens` function:

```solidity
airdropContract.distributeTokens(recipientAddress, tokenId);
```

The function transfers one unit of the specified `tokenId` to the `recipientAddress` and emits a `TokensDistributed` event.

