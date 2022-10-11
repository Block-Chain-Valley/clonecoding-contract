//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./myERC20.sol";

contract myToken2 is myERC20 {
  uint public INITIAL_SUPPLY = 10;
  constructor() public myERC20("Jiho", "JihoSymbol") {
    _mint(msg.sender, INITIAL_SUPPLY);
  }
}