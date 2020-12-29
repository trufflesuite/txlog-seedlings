// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "./Bar.sol";


contract Foo {
  Bar bar;

  constructor(Bar _bar) public {
    bar = _bar;
  }

  function testBar(uint x) public returns(uint) {
    return bar.inc(x);
  }

  function testBarTwice(uint x) public returns(uint) {
    uint tmp = bar.inc(x);
    return bar.inc(tmp);
  }

  function testBarTwiceRevert(uint x) public returns(uint) {
    uint tmp = bar.incRevert(x);
    return bar.incRevert(tmp);
  }
}