// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Second {

  constructor() payable {}

  function double_revert(uint x) public pure returns (uint) {
    require(false, 'Rats! Conditions are imperfect\nIm a bit sleepy...');
    return 2 * x;
  }

  function double(uint x) public pure returns (uint) {
    return 2 * x;
  }

}
