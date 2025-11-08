// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "src/BridgeEth.sol";
import "src/USDT.sol";
import {IERC20} from "@openzeplin/contracts/token/ERC20/IERC20.sol";
contract TestContract is Test {
    BridgeEth bridge;
    USDT usdt;
    function setUp() public {
        usdt = new USDT();
        bridge = new BridgeEth(address(usdt));
    }
    function setUp() public {
        c = new BridgeEth();
    }
    function test_Deposit() public {
        usdt.mint(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb, 200);
        vm.startPrank(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb);
        usdt.approve(address(bridge), 200);
        bridge.deposit(usdt, 200);
        assertEq(usdt.balanceOf(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb), 0);
        assertEq(usdt.balanceOf(address(bridge)), 200);
        bridge.withdraw(usdt, 100);
        assertEq(
            usdt.balanceOf(0xb9d88253b3dd57f9e7b1059286009d0420cec5bb),
            100
        );
        assertEq(usdt.balanceOf(address(bridge)), 100);
    }
}
