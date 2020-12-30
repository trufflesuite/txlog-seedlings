// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Bar.sol";

contract Foo {
  Bar bar;

  constructor(Bar _bar) { bar = _bar; }

  function testBar(uint x) public returns(uint) { return bar.inc(x); }

  function testBarTwice(uint x) public returns(uint) { return bar.inc(bar.inc(x)); }

  function testBarTwiceRevert(uint x) public returns(uint) { return bar.incRevert(bar.incRevert(x)); }

  function tryAndCatchRevert(uint x) public returns(uint) { return bar.inc(bar.tryAndCatchRevert(x)); }
}
