// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Second {

  function double_revert(uint x) public pure returns (uint) {
    require(false, 'rats! imperfect conditions!');
    return 2 * x;
  }

  function double(uint x) public pure returns (uint) {
    return 2 * x;
  }

}
