// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "src/LockUSDT.sol";
import "src/USDT.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract TestContract is Test {
    Lock lock;
    USDT usdt;
    function setUp() public {
        usdt = new USDT();
        lock = new Lock(address(usdt));
    }
    function setUp() public {
        c = new Lock();
    }
    function test_Deposit() public {
        usdt.mint(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb, 200);
        vm.startPrank(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb);
        usdt.approve(address(lock), 200);
        lock.deposit(usdt, 200);
        assertEq(usdt.balanceOf(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb), 0);
        assertEq(usdt.balanceOf(address(lock)), 200);
        lock.withdraw(usdt, 100);
        assertEq(
            usdt.balanceOf(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb),
            100
        );
        assertEq(usdt.balanceOf(address(lock)), 100);
    }
}
