// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract CoinCrypto {

    string public ticker;
    address public owner;
    mapping(address => uint) public balances;

    constructor(string memory _ticker) {
        ticker = _ticker;
        owner = msg.sender;
    }

    function mint(address _to, uint _amount) public {
        require(msg.sender == owner);
        balances[_to] += _amount;
    }

    function send(address _to, uint _amount) public  {
        require(balances[msg.sender] >= _amount, "Saldo insuficiente");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}