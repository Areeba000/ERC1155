# TokenLocker Contract

The TokenLocker contract is a smart contract that allows users to lock and unlock ERC1155 tokens. It tracks the locked tokens for each user and provides functions to facilitate token locking and unlocking.

## Contract Details

- **Name:** TokenLocker Contract

## Features

The TokenLocker Contract includes the following features:

- **Token Locking**: Users can lock ERC1155 tokens in the contract.
- **Token Unlocking**: Users can unlock previously locked tokens.
- **Token Tracking**: The contract tracks locked tokens for each user.
- **Safety Checks**: Users can only unlock tokens they have previously locked.
- **Integration with ERC1155**: Interacts with ERC1155 tokens to perform locking and unlocking operations.

## Getting Started

To use the TokenLocker Contract in your project, you can deploy it and interact with it using the provided functions. You should specify the address of the ERC1155 token you want to lock and unlock tokens for.

## Usage

The TokenLocker Contract provides the following functions for token locking and unlocking:

### Lock Token

Users can lock ERC1155 tokens by using the `lockToken` function. The function requires three parameters:

- `tokenContract`: The address of the ERC1155 token contract.
- `tokenId`: The identifier of the token to be locked.
- `tokenAmount`: The amount of tokens to be locked.

Example usage:

```solidity
tokenLocker.lockToken(tokenContractAddress, tokenId, tokenAmount);
```

### Unlock Token

Users can unlock previously locked tokens using the `unlockToken` function. The function also requires three parameters:

- `tokenContract`: The address of the ERC1155 token contract.
- `tokenId`: The identifier of the token to be unlocked.
- `tokenAmount`: The amount of tokens to be unlocked.

Example usage:

```solidity
tokenLocker.unlockToken(tokenContractAddress, tokenId, tokenAmount);
```

### Check if Token is Locked

Users can check if a token is locked for a specific address using the `istokenLocked` function. It returns a boolean value indicating whether the token is locked.

Example usage:

```solidity
bool isLocked = tokenLocker.istokenLocked(tokenContractAddress, userAddress);
```
