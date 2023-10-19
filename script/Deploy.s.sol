// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { ChiliTokenNonUpgradable } from "../src/ChiliTokenNonUpgradable.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {

        // deploy impl contract
        vm.startBroadcast();

        address admin = vm.envAddress("ADMIN_ADDRESS");

        address token = address(new ChiliTokenNonUpgradable(admin));

        console2.log("token address: ", token);
    
        vm.stopBroadcast();
    }
}
