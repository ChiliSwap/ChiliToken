// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;


import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC20Burnable } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import { ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import { AccessControl } from "@openzeppelin/contracts/access/AccessControl.sol";

contract ChiliTokenNonUpgradable is ERC20, ERC20Burnable, ERC20Permit,AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint public constant PRE_MINING_SUPPLY = 10500000 * 1e18; // 10.5M
    uint public constant MAX_SUPPLY = 21000000 * 1e18; // 21M
    uint public minted; // total minted amount, monotonically increasing, and be less than or equal to 21M

    constructor(address _admin) ERC20("ChiliSwap", "CHILI") ERC20Permit("ChiliSwap") {
        _setupRole(DEFAULT_ADMIN_ROLE, _admin);
        
        // pre-mint
        minted += PRE_MINING_SUPPLY;
        _mint(_admin, PRE_MINING_SUPPLY);
    }



    /// @dev The total amount of tokens minted should be less than or equal to 21M.
    /// If some tokens are burnt, the max supply will be less than 21M. 
    function mint(address to, uint256 amount) onlyRole(MINTER_ROLE) public  {
        require(minted + amount <= MAX_SUPPLY, "ChiliToken: minted amount exceeds 21M");
        minted += amount;
        _mint(to, amount);
    }

}