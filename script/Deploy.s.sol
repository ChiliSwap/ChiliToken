// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { TransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import { ChiliToken } from "../src/ChiliToken.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {

        // deploy impl contract
        vm.startBroadcast();
        address impl = address(new ChiliToken());

        console2.log("impl address: %s", impl);

        // deploy proxy admin 
        address admin = address(new ProxyAdmin());
        console2.log("admin address: %s", admin);

        // deploy proxy & init 
        address proxy = address(new TransparentUpgradeableProxy(impl, admin, abi.encodeWithSignature("initialize()")));
        console2.log("proxy address: %s", proxy);

        vm.stopBroadcast();
    }
}
