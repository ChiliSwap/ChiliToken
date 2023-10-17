// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {console2, Test} from "forge-std/Test.sol";
import { ChiliToken } from "../src/ChiliToken.sol";


contract TestSmoke is Test{

    ChiliToken sut;

    function setUp() public {

        // The implementation contract cannot be used directly
        address impl = address(new ChiliToken());

        

        // initialize 
        sut.initialize();
    }

    function test_mint() public {
        sut.mint(address(this), 1000);
        assertEq(sut.balanceOf(address(this)), 1000);
    }
}