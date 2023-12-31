// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";


library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
  }
    c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return a / b;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

contract SimpleStaking  {
    // Library usage
    IERC1155 public nftToken;
    using SafeMath for uint256;
    IERC1155 public token;
    mapping(address => uint256) public stakers;
    event tokensStaked(address from, uint256 amount);
    event TokensUnstaked(address to, uint256 amount);

    constructor(IERC1155 _token){
       token = _token;
    }

    function stakeNFT(uint256 tokenid)public{
        token.safeTransferFrom(msg.sender, address(this), tokenid, 1, "");
        stakers[msg.sender] = stakers[msg.sender].add(tokenid);
        emit tokensStaked(msg.sender, tokenid);
    }
    
    function unstake()public{
        require(istokenstake(msg.sender),"Not a staker");
        uint256 amount = stakers[msg.sender];
        token.safeTransferFrom(address(this), msg.sender, amount, 0, "");
        stakers[msg.sender] = 0;
        emit TokensUnstaked(msg.sender,stakers[msg.sender]);
    }

    function istokenstake(address _owner)public view returns(bool){
        return stakers[_owner]> 0;
    }
    
    
}
