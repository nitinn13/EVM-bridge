// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BridgeETH is Ownable {
    uint public balance;
    address public tokenAddress;

    event Deposit(address indexed depositer, uint amount);

    mapping(address => uint) public pendingBalances;


    constructor(address _tokenAddress) Ownable(msg.sender) {
        tokenAddress = _tokenAddress;
    }

    function lock(IERC20 _tokenAddress, uint _amount) public {
        require(address(tokenAddress) == tokenAddress);
        require(_tokenAddress.allowance(msg.sender, address(this)) >= _amount);
        _tokenAddress.transferFrom(msg.sender, address(this), _amount);
        emit Deposit(msg.sender, _amount);
    }

    function unlock(IERC20 _tokenAddress, uint _amount) public {
        require(address(tokenAddress) == tokenAddress);
        require(pendingBalances[msg.sender] >= _amount);
        pendingBalances[msg.sender] -= _amount;
        _tokenAddress.transfer(msg.sender, _amount);
    }

    function burnedOnOppositeChain(
        address userAccount,
        uint256 _amount
    ) public onlyOwner {
        pendingBalances[userAccount] += _amount;
    }
}
