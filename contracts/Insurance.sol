// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// a terrible and useless insurance contract
contract Insurance {
  address payable [] public clients;
  event LogRegistered(address insured, address registrant);
  event LogPayout(address insured, uint value);

  constructor() { }

  function register(address payable a) public {
    clients.push(a);
    emit LogRegistered(a, msg.sender);
  }

  function payout(uint funds) public {
    for (uint i = 0; i < clients.length; i++) {
      clients[i].transfer(funds);
      LogPayout(clients[i], funds);
    }
  }

  receive() external payable { }
}
