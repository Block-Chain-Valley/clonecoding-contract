//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./myERC20.sol";

contract MyToken is myERC20 {
  uint public INITIAL_SUPPLY = <amount>;
  constructor() public myERC20("<name>", "<symbol>") {
    _mint(msg.sender, INITIAL_SUPPLY);
  }
}