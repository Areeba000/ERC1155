# SimpleStaking Contract

The SimpleStaking contract is a smart contract that allows users to stake and unstake ERC1155 tokens. Users can stake tokens, track their staked tokens, and later unstake them when needed.

## Contract Details

- **Name:** SimpleStaking Contract
  
## Features

The SimpleStaking Contract includes the following features:

- **Token Staking**: Users can stake ERC1155 tokens using the `stakeNFT` function.
- **Token Unstaking**: Users can unstake previously staked tokens using the `unstake` function.
- **Balance Tracking**: The contract tracks the staked tokens for each user.
- **Safety Checks**: Users can only unstake tokens if they have previously staked them.
- **Integration with ERC1155**: Interacts with ERC1155 tokens to perform staking and unstaking operations.
- **SafeMath**: Utilizes SafeMath library to prevent overflow/underflow issues.

## Getting Started

To use the SimpleStaking Contract in your project, you need to deploy it with an address of the ERC1155 token you want to stake and unstake tokens for.

## Usage

The SimpleStaking Contract provides the following functions for token staking and unstaking:

### Stake NFT

Users can stake ERC1155 tokens using the `stakeNFT` function. The function requires one parameter:

- `tokenId`: The identifier of the token to be staked.

Example usage:

```solidity
simpleStaking.stakeNFT(tokenId);
```

The function transfers the specified token from the user's address to the contract and tracks the staked amount.

### Unstake

Users can unstake previously staked tokens using the `unstake` function. The function does not require any parameters.

Example usage:

```solidity
simpleStaking.unstake();
```

The function checks if the sender has previously staked tokens, then transfers the staked tokens back to the sender and updates the staked amount to zero.

### Check Staking Status

Users can check if they have staked tokens using the `istokenstake` function. It returns a boolean value indicating whether the user has staked tokens.

Example usage:

```solidity
bool isStaked = simpleStaking.istokenstake(userAddress);
```

