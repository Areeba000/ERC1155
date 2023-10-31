// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Airdrop is Ownable {
    IERC1155 public tokenid; // The ERC-20 token to be distributed
    event TokensDistributed(address indexed recipient, uint256 tokenId);

    constructor(address _tokenid) {
        tokenid = IERC1155(_tokenid);
    }

    function distributeTokens(address recipient, uint256 tokenId) external onlyOwner {
        tokenid.safeTransferFrom(msg.sender, recipient, tokenId, 1, "");
        emit TokensDistributed(recipient, tokenId);
    }  
}
