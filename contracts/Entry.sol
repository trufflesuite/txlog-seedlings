// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./First.sol";

contract Entry {
  First first;

  constructor(First _first) { first = _first; }

  function test_a_call(uint x) public returns(uint) { return first.inc(x); }

  function test_a_call_twice(uint x) public returns(uint) { return first.inc(first.inc(x)); }

  function test_a_revert(uint x) public returns(uint) { return first.inc(first.inc_revert(x)); }

  function tryAndCatchRevert(uint x) public returns(uint) { return first.inc(first.catch_revert(x)); }
}
