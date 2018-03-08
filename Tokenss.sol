pragma solidity ^0.4.0;
 contract erc20
{
     function totalSupply() public  returns (uint256);
     function mint(uint256 tokens) public returns(uint256);
     function transfer(address to, uint tokens) public returns (uint256,uint256);
    // function transferfrom(address spender,address to,uint256 tokens) public returns(bool success);
     
     
}
contract bankWallot is erc20
{
    string public constant name="tok";
    string public constant symbol="$";
    uint256 public constant decimals=18;
    uint256 public constant totalsupply=1000;
    uint256 tokens;
    uint256 balance;
   
    mapping(address=>uint256) balancekey;
    mapping(address=>mapping(address=>uint256)) allowed;

    modifier check(address owner)
    {
        require(owner==msg.sender);
        _;
    }

  function totalSupply() public  returns (uint256)
  {
      
      return totalsupply;
  }
  function mint(uint256 tokens) public returns(uint256)
  {
      require(tokens<totalsupply);
      
      balancekey[msg.sender]=tokens;
      
       
      return balancekey[msg.sender];
       
  }
 function transfer(address to, uint256 tokens) public returns (uint256,uint256)
 {
     require(tokens<=balancekey[msg.sender]);
     balancekey[msg.sender]-=tokens;
      balancekey[to]+=tokens;
      return( balancekey[msg.sender],balancekey[to]);
    
 }
 /*
 function transferfrom(address spender,address to,uint256 tokens) public returns(bool success)
 {
     require(tokens<=totalsupply);
     //allowed[msg.sender][spender];
     balancekey[msg.sender].balance-=tokens;
     allowed[msg.sender][spender].balance-=tokens;
     balancekey[to].balance+=tokens;
     return true;
     
 }*/
}
 
