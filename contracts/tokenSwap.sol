// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSwap {
    IERC20 public token1;
    IERC20 public token2;

    constructor(
        address _token1,    
        address _token2,
    ) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
    
    }

    function swap(address owner1, uint256 amount1, address owner2, uint256 amount2) public {
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Token 2 allowance too low"
        );

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }

    function _safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint _amount
    ) private {
        bool sent = token.transferFrom(from, to, _amount);
        require(sent, "Token transfer failed");
    }
}