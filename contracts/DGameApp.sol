// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DGameApp  {
   /**
    *  @dev Prints Hello World string
    */
   /* uint256 public Players;
    address[] public  
    constructor(){
      owner=msg.sender;
    }*/
   struct Bet  {
      uint256 id;
      address owner;
      uint option;
      uint timeSpan;
      uint betPrice;
   }

   mapping(address => Bet[]) public bets;
   uint public Balance = 1000;

   function updatebalance(uint _betNumber, uint _betprice)  public  {
    require(_betNumber <= 10 ,"Invalid Input");
     require(Balance >= _betprice ,"Insufficient Balance"); 
     require(_betprice != 0 , "Betting cannot be 0");
      Bet memory newBet = Bet({
         id: bets[msg.sender].length,
         owner: msg.sender,
         option: _betNumber,
         timeSpan: block.timestamp,
         betPrice: _betprice
      });
       bets[msg.sender].push(newBet);
       Balance=Balance-_betprice;
      
   }
   function getBet(uint _i) public view returns (Bet memory){
    return bets[msg.sender][_i];
   }
   function getAllBet(address _owner) public view returns (Bet[] memory ){
        return bets[_owner];
    }
   function getAllPlayers() public view returns (Bet[] memory){
      return bets[msg.sender];
   }
}
