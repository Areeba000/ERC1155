// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1155ICO is Ownable {
    ERC1155 public token; // The ERC1155 token to be distributed
    uint256 public tokenPrice; // Price of 1 token in wei
    uint256 public totalTokens; // Total tokens available for sale
    uint256 public tokensSold; // Total tokens sold
    bool public isICOActive; // Flag to indicate if the ICO is active

    mapping(address => uint256) public tokenBalances;
    mapping(address => uint256) public ethBalances;

    event TokensPurchased(address indexed buyer, uint256 tokensBought, uint256 ethSpent);
    event ICOActivated();
    event ICODeactivated();

    constructor(address _token, uint256 _tokenPrice, uint256 _totalTokens) {
        token = ERC1155(_token);
        tokenPrice = _tokenPrice;
        totalTokens = _totalTokens;
        isICOActive = false;
    }

    modifier onlyWhenICOActive() {
        require(isICOActive, "ICO is not active");
        _;
    }

    modifier hasAvailableTokens(uint256 amount) {
        require(tokensSold + amount <= totalTokens, "Not enough tokens available");
        _;
    }

    receive() external payable onlyWhenICOActive {
        buyTokens(msg.value);
    }

    function activateICO() external onlyOwner {
        require(!isICOActive, "ICO is already active");
        isICOActive = true;
        emit ICOActivated();
    }

    function deactivateICO() external onlyOwner {
        require(isICOActive, "ICO is not active");
        isICOActive = false;
        emit ICODeactivated();
    }

    function buyTokens(uint256 ethAmount) public payable onlyWhenICOActive hasAvailableTokens(ethAmount / tokenPrice) {
        uint256 tokenAmount = ethAmount / tokenPrice;

        require(tokenBalances[msg.sender] + tokenAmount <= totalTokens, "Exceeds token purchase limit");

        ethBalances[msg.sender] += ethAmount;
        tokenBalances[msg.sender] += tokenAmount;
        tokensSold += tokenAmount;

        emit TokensPurchased(msg.sender, tokenAmount, ethAmount);
    }

    function withdrawEth() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawTokens() public {
        uint256 tokenAmount = tokenBalances[msg.sender];
        require(tokenAmount > 0, "No tokens to withdraw");

        tokenBalances[msg.sender] = 0;
        token.safeTransferFrom(address(this), msg.sender, 0, tokenAmount, "");

        tokensSold -= tokenAmount;
    }
}
