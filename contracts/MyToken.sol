//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./myERC20.sol";

contract MyToken is myERC20 {
  uint public INITIAL_SUPPLY = 1000000;
  constructor() public myERC20("cWrong Token", "CWT") {
    _mint(msg.sender, INITIAL_SUPPLY);
  }
}