// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Spam.sol";

contract Bar {
  Spam spam;

  constructor(Spam _spam) { spam = _spam; }

  function internal_inc(uint x) pure internal returns (uint) {
    return x + 1;
  }

  function inc(uint x) public returns (uint) {
    return internal_inc(spam.double(x));
  }

  function incRevert(uint x) public returns (uint) {
    return internal_inc(spam.doubleRevert(x));
  }

  function tryAndCatchRevert(uint x) public returns(uint) {
    uint rv;
    try spam.doubleRevert(x) returns (uint twice) {
      rv = twice;
    } catch Error(string memory /*someReason*/) {
      rv = internal_inc(x + x - 1);
    } catch(bytes memory /*someCrypticData*/) {
      rv = internal_inc(x + x - 1);
    }
    return rv;
  }
}
