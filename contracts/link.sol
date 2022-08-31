// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Link is ERC20, Ownable {
    constructor() ERC20("Link Token", "LNK") {}

    function mint(uint _amount) internal {
        _mint(msg.sender, _amount);
    }
}