
pragma solidity ^0.4.0;
 contract erc20
{
     function totalSupply() public  returns (uint256);
     function mint(uint256 tokens) public view returns(uint256);
     function transfer(address to, uint tokens) public returns (uint256,uint256);    
     
}
contract bankWallot is erc20
{
    string public constant name="tok";
    string public constant symbol="$";
    uint256 public constant decimals=18;
    uint256 public constant totalsupply=1000;
    uint256 tokens;
    uint256 balance;
    struct details
    {
        uint256 balance;
    }
    mapping(address=>details)balancekey;
    mapping(address=>mapping(address=>details))allowed;

    modifier check(address owner)
    {
        require(owner==msg.sender);
        _;
    }

  function totalSupply() public  returns (uint256)
  {
      
      return totalsupply;
  }
  function mint(uint256 tokens) public view returns(uint256)
  {
      require(tokens<totalsupply);
      
      balancekey[msg.sender].balance=tokens;
      
       
      return balancekey[msg.sender].balance;
       
  }
 function transfer(address to, uint256 tokens) public returns (uint256,uint256)
 {
     require(tokens<=totalsupply);
     balancekey[msg.sender].balance-=tokens;
      balancekey[to].balance+=tokens;
      return( balancekey[msg.sender].balance,balancekey[to].balance);
    
 }

}
 
