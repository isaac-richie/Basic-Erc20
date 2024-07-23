// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


import {Script} from "forge-std/Script.sol";
import {Draco} from "../src/Draco.sol";

contract DeployDraco is Script {

    uint256 public constant INITIAL_SUPPLY = 1000 ether;

  function run() external returns (Draco) {
    vm.startBroadcast();
    Draco draco = new Draco(INITIAL_SUPPLY);
    vm.stopBroadcast();
    return draco;

  }


}


