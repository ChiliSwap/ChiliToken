// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {console2, Test} from "forge-std/Test.sol";
import { ChiliTokenNonUpgradable } from "../src/ChiliTokenNonUpgradable.sol";


contract TestChiliToken is Test {

    ChiliTokenNonUpgradable token;

    function setUp() public {
        address admin = address(this);
        token = new ChiliTokenNonUpgradable(admin);
    }

    function test_only_minter_can_mint() external{
        
        // only minter can mint
        address minter = address(this);
        token.grantRole(token.MINTER_ROLE(), minter);
        token.mint(address(this), 100);


        // non-minter can not mint
        token.revokeRole(token.MINTER_ROLE(), minter);
        vm.expectRevert();
        token.mint(address(this), 100);
    }

    function test_max_minted_amount() external{
        address minter = address(this);
        token.grantRole(token.MINTER_ROLE(), minter);

        // minted amount should be less than or equal to 21M
        // But we have pre-mined 10.5M, so we can only mint 10.5M more
        token.mint(address(this), 10500000 ether);

        
        vm.expectRevert("ChiliToken: minted amount exceeds 21M");
        token.mint(address(this), 1);


        // Let's burn 1M 
        token.burn(1000000 ether);
        assertTrue(token.totalSupply() == 20000000 ether);

        // But we still cannot mint any token because we have already minted 21M

        vm.expectRevert("ChiliToken: minted amount exceeds 21M");
        token.mint(address(this), 1);
    }


    
}


