// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;


import { ERC20Upgradeable } from "@openzeppelin-contracts-upgradeable/contracts/token/ERC20/ERC20Upgradeable.sol";
import { ERC20BurnableUpgradeable } from "@openzeppelin-contracts-upgradeable/contracts/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import { ERC20PermitUpgradeable } from "@openzeppelin-contracts-upgradeable/contracts/token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";
import { AccessControlUpgradeable } from "@openzeppelin-contracts-upgradeable/contracts/access/AccessControlUpgradeable.sol";

contract ChiliToken is ERC20Upgradeable, ERC20BurnableUpgradeable, ERC20PermitUpgradeable,AccessControlUpgradeable {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint public constant PRE_MINING_SUPPLY = 10500000 * 1e18; // 10.5M

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __ERC20_init("Chiliswap", "CHILI");
        __ERC20Burnable_init();
        __ERC20Permit_init("Chiliswap");
        __AccessControl_init();

        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        
        // pre-mint
        _mint(msg.sender, PRE_MINING_SUPPLY);

    }

    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "ChiliToken: must have minter role to mint");
        _mint(to, amount);
    }

}