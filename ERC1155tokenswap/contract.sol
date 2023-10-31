// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

// TokenSwap contract for swapping tokens between two parties.
contract TokenSwap {
    IERC1155 public token1; // The first ERC20 token.
    IERC1155 public token2; // The second ERC20 token.
    address public owner1; // The address of the owner of token1.
    address public owner2; // The address of the owner of token2.

    // Constructor to initialize the contract with token addresses and owners.
    constructor(address _token1, address _owner1, address _token2, address _owner2) {
        token1 = IERC1155(_token1);
        owner1 = _owner1;
        token2 = IERC1155(_token2);
        owner2 = _owner2;
    }

    // Swap tokens between owner1 and owner2.

   function swap(uint256 _tokenId1, uint256 _tokenId2) public {
       require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
       require(token1.balanceOf(owner1, _tokenId1) > 0, "Token 1 not owned by owner1");
       require(token2.balanceOf(owner2, _tokenId2) > 0, "Token 2 not owned by owner2");
    
       token1.safeTransferFrom(owner1, owner2, _tokenId1, 1, "");
       token2.safeTransferFrom(owner2, owner1, _tokenId2, 1, "");
}

    
}
