// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Spam.sol";

contract Bar {
  Spam spam;
  uint public lastValue;

  constructor(Spam _spam) public { spam = _spam; }

  function inside(uint x) pure internal returns (uint) {
    return x + 1;
  }

  function inc(uint x) public returns (uint) {
    lastValue = spam.double(x) ;
    lastValue = inside(lastValue);
    return lastValue;
  }

  function incRevert(uint x) public returns (uint) {
    lastValue = spam.doubleRevert(x) + 1;
    lastValue = inside(lastValue);
    return lastValue;
  }

}
