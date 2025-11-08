// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
 
import "openzeppelin-contracts/contracts/access/Ownable.sol";


contract BridgeEth is Ownable {

    address public tokenAddress;
    uint public balance;

    constructor(address _tokenAddress ) Ownable(msg.sender){
        tokenAddress = _tokenAddress;
    }

    function deposit(address token , uint value) public {

    }
    function withdraw(address token , uint value) public {

    }
}
