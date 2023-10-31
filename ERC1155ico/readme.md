# ERC1155 ICO Contract

The ERC1155 ICO contract is designed to facilitate an Initial Coin Offering (ICO) for ERC1155 tokens. It allows users to purchase ERC1155 tokens by sending Ether (ETH) to the contract.

## Features

- Purchase ERC1155 tokens with Ether (ETH).

- Ability to activate and deactivate the ICO.

- Keep track of token balances and ETH balances for users.

- Ensure that the ICO is active before allowing purchases.

- Limit the number of tokens a user can purchase based on their balance and the total available tokens.

- Withdraw Ether and purchased tokens.

## Usage

1. Deploy the contract, specifying the address of the ERC1155 token, the token price in wei, and the total number of tokens available for sale.

2. Activate the ICO using the `activateICO` function. Only the owner can activate the ICO.

3. Users can send Ether to the contract address to purchase tokens. The contract will calculate the number of tokens they receive based on the ETH sent and the token price.

4. The owner can deactivate the ICO using the `deactivateICO` function when the ICO period is over.

5. Users can check their token balances and ETH balances using the `tokenBalances` and `ethBalances` mappings.

6. Users can withdraw their purchased tokens using the `withdrawTokens` function, and the owner can withdraw the accumulated Ether using the `withdrawEth` function.


