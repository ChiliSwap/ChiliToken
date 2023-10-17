// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;


import { ERC20Upgradeable } from "@openzeppelin-contracts-upgradeable/contracts/token/ERC20/ERC20Upgradeable.sol";
import { ERC20BurnableUpgradeable } from "@openzeppelin-contracts-upgradeable/contracts/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import { ERC20PermitUpgradeable } from "@openzeppelin-contracts-upgradeable/contracts/token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";
import { AccessControlUpgradeable } from "@openzeppelin-contracts-upgradeable/contracts/access/AccessControlUpgradeable.sol";

contract ChiliToken is ERC20Upgradeable, ERC20BurnableUpgradeable, ERC20PermitUpgradeable,AccessControlUpgradeable {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint public constant PRE_MINING_SUPPLY = 10500000 * 1e18; // 10.5M


    mapping(address => bool) public fromWhiteList; // in the beginning, only the masterchef can send tokens

    bool public isWhiteListEnabled; // if true, only whitelisted addresses can send/receive tokens

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

        // enable whitelist
        isWhiteListEnabled = true;
    }

    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "ChiliToken: must have minter role to mint");
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override(ERC20Upgradeable) {
        super._beforeTokenTransfer(from, to, amount);

        // mint: from == address(0)
        // burn: to == address(0)
        require(from == address(0) || fromWhiteList[from] || to == address(0),
            "Non-whitelisted addresses are prohibited from transfer");
    }


    // whitelist management 
    function addFromWhiteList(address account) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(account != address(0), "account cannot be 0 address");
        fromWhiteList[account] = true;
    }

    function removeFromWhiteList(address account) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(account != address(0), "account cannot be 0 address");
        delete fromWhiteList[account];
    }

    function enableWhiteList() external onlyRole(DEFAULT_ADMIN_ROLE) {
        isWhiteListEnabled = true;
    }

    function disableWhiteList() external onlyRole(DEFAULT_ADMIN_ROLE) {
        isWhiteListEnabled = false;
    }

}