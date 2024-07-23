// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Draco} from "../src/Draco.sol";
import {DeployDraco} from "../Script/DeployDraco.s.sol";

contract DracoTest is Test {
    Draco public draco;
    DeployDraco public deployer;

    //dummy addresses
    address bob = makeAddr("Bob");
    address alice = makeAddr("Alice");

    uint256 public constant STARTING_BALANCE = 100 ether;
    uint256 public constant INITIAL_SUPPLY = 10000000 ether;

    function run() external {
        deployer = new DeployDraco();
        draco = deployer.run();
        vm.prank(msg.sender);
        draco.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, draco.balanceOf(bob));
    }

    function testInitialSupply() public {
        assertEq(INITIAL_SUPPLY, deployer.INITIAL_SUPPLY);
    }
}
