//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./IERC20.sol";

contract myERC20 is IERC20{
    

    string private _name;
    string private _symbol;
    uint private _totalSupply;
    mapping(address=>uint256) private _balance;
    mapping(address=>mapping(address=>uint)) private _allow;
    

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

    function totalSupply() external view returns (uint256){
        return _totalSupply;


    }

    function balanceOf(address account) external view returns (uint256){

        return _balance[account];
    }

    
    function transfer(address to, uint256 amount) external returns (bool){
        if(_balance[msg.sender]>=amount){
            _balance[msg.sender]-=amount;
            _balance[to]+=amount;
            return true;
        }else{
            return false;
        }
            
    }

   
    function allowance(address owner, address spender) external view returns (uint256){
        return _allow[owner][spender];
    }

    
    function approve(address spender, uint256 amount) external returns (bool){
        if(_balance[msg.sender]>=amount){
        _allow[msg.sender][spender]+=amount;
        return true;
        }
        else{
            return false;
        }
    }

    
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool){

        if(_balance[from]>=amount){
            _balance[from]-=amount;
            _balance[to]+=amount;
            _allow[from][msg.sender]-=amount;
            return true;
        }
        else{
            return false;
        }
    }

    function _mint(address _address, uint256 _supply) internal{
        _balance[_address]+=_supply;
        _totalSupply+=_supply;
    }
}