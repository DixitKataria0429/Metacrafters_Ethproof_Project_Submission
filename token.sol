// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS

Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
Your contract will have a mapping of addresses to balances (address => uint)
You will have a mint function that takes two parameters: an address and a value.
The function then increases the total supply by that number and increases the balance
of the “sender” address by that amount
Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens.
It will take an address and value just like the mint functions. It will then deduct the value from the total supply
and from the balance of the “sender”.
Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal
to the amount that is supposed to be burned.
*/

contract tokening {

    // Variables
    string public tokenName="Dixit";
    string public tokenSymbol="India";
    uint256 public totalSupply=0;

    // Mapping to track token balences
    mapping(address => uint256) public balances;

    // Minting Function to create new tokens

    function mint(address _to, uint256 _value) external {
        require(_to != address(0), "Invalid address");
        totalSupply += _value;
        balances[_to] += _value;
    }

    // Burn Function to destroy token
    function burn(uint256 _value) external {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[msg.sender] -= _value;
    }

}