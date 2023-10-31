// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract tokenlocker {
    mapping(address => mapping(address => uint256)) public lockedTokens;
    
    function locktoken(address tokenContract, uint256 tokenId, uint256 tokenAmount) public {
        ERC1155(tokenContract).safeTransferFrom(msg.sender, address(this), tokenId, tokenAmount, "");
               lockedTokens[tokenContract][msg.sender] += tokenAmount;
    }

    function unlockToken(address tokenContract, uint256 tokenId, uint256 tokenAmount) public {
        require(lockedTokens[tokenContract][msg.sender] >= tokenAmount, "Not enough tokens locked");
        ERC1155(tokenContract).safeTransferFrom(address(this), msg.sender, tokenId, tokenAmount, "");
        lockedTokens[tokenContract][msg.sender] -= tokenAmount;
    }

    function istokenLocked(address tokenContract, address owner) public view returns (bool) {
        return lockedTokens[tokenContract][owner] > 0;
    }
}
