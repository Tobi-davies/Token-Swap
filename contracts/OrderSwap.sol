// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OrderSwap {
  struct Order {
    address sender;
    address fromToken;
    address toToken;
    uint256 amountIn;
    uint256 amountOut;
    uint256 deadline;
    bool executed;
  }


  uint ID = 1;

  mappint (uint => Order) public orders;

  function createOrder (  address _fromToken,
    address _toToken,
    uint256 _amountIn,
    uint256 _deadline) public {
      require(address(_fromToken) != address(0))
      require(address(_toToken) != address(0))
      Order storage order = orders[ID];
      order.sender = msg.sender;
      order.fromToken = _fromToken;
      order.toToken = _toToken;
      order.amountIn = _amountIn;
      order.amountOut = _amountOut;
      order.deadline = _deadline;
      order.executed = false;

      ID++

  }

 function executeOrder (uint id) public {
   Order memory order = orders[id];
   require(!order.executed, "order executed");
     require(IERC20(order.token2).transferFrom(msg.sender, address(this), ORD.amountDesired),"Error: Transaction Failed");
        require(IERC20(order.fromToken).transfer(msg.sender, order.amountIn), "Error: failed to swap token one");
        require(IERC20(order.toToken).transfer(order.sender, order.amountOut), "Error: failed to swap token two");

 }
}