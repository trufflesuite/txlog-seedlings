// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Spam.sol";

contract Bar {
  Spam spam;
  uint public lastValue;

  constructor(Spam _spam) { spam = _spam; }

  function inside(uint x) pure internal returns (uint) {
    return x + 1;
  }

  function inc(uint x) public returns (uint) {
    lastValue = spam.double(x) ;
    lastValue = inside(lastValue);
    return lastValue;
  }

  function incRevert(uint x) public returns (uint) {
    lastValue = spam.doubleRevert(x);
    lastValue = inside(lastValue);
    return lastValue;
  }

  function tryAndCatchRevert(uint x) public returns(uint) {
    try spam.doubleRevert(x) returns (uint twice) {
      lastValue = twice;
    } catch Error(string memory /*someReason*/) {
      lastValue = inside(lastValue + lastValue);
    } catch(bytes memory /*crypticData*/) {
      lastValue = inside(lastValue + lastValue);
    }
    return lastValue;
  }

}
