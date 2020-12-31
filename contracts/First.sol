// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Second.sol";

contract First {
  Second second;

  constructor(Second _second) { second = _second; }

  function self_inc(uint x) pure internal returns (uint) {
    return x + 1;
  }

  function inc(uint x) public returns (uint) {
    return self_inc(x);
  }

  function inc_revert(uint x) public returns (uint) {
    require(false, "drats!");
    return self_inc(x);
  }

  function big_inc(uint x) public returns (uint) {
    return self_inc(second.double(x));
  }

  function big_inc_revert(uint x) public returns (uint) {
    return self_inc(second.double_revert(x));
  }

  function catch_revert(uint x) public returns(uint) {
    uint rv;
    try second.double_revert(x) returns (uint twice) {
      rv = twice;
    } catch Error(string memory /*someReason*/) {
      rv = self_inc(x);
    } catch(bytes memory /*someCrypticData*/) {
      rv = self_inc(x);
    }
    return rv;
  }
}
