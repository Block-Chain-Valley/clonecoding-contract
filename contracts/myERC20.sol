// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.17;

import "./myIERC20.sol";

contract myERC20 is myIERC20 {

		string private _name;
        string private _symbol;
        uint256 private _totalSupply;
        mapping(address => uint256) private _balance;
        mapping(address => mapping(address => uint256)) private _allowance;

		constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual returns (uint8) {
        return 0;
    }

	function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balance[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        address owner = msg.sender;
        require(_balance[owner] >= amount, "Not Enough balance");
        _balance[owner] -= amount;
        _balance[to] += amount;
        emit Transfer(owner, to, amount);
        return true;
    }

    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowance[owner][spender];
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        address owner = msg.sender;
        _allowance[owner][spender] += amount;
        emit Approval(owner, spender, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {
        require(_allowance[from][msg.sender] >= amount, "Not Enough allowance");
        require(_balance[from] >= amount, "Not Enough balance");
        address owner = msg.sender;
        _allowance[from][owner] -= amount;

        _balance[from] -= amount;
        _balance[to] += amount;

        emit Transfer(from, to, amount);
        return true;
    }

    function _mint(
        address to,
        uint256 amount
    ) internal returns (bool) {
        _totalSupply += amount;
        _balance[to] += amount;
        return true;
    }

}