// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ReentrancyAttack {

  function callSender() public {
    // solium-disable-next-line security/no-low-level-calls
    (bool result,) = msg.sender.call(abi.encode("incrementCountCb(string memory)", "incFromAttacker"));
    require(result);
  }

}
