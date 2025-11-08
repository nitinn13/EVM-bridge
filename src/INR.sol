// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract INR is ERC20, Ownable {
    constructor() ERC20("Indian Rupee", "INR") Ownable(msg.sender) {

    }


    function mint(address _to, uint _amount) public onlyOwner {
        _mint(_to, _amount);
    }
}
