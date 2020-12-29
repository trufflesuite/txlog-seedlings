// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Spam {

  function doubleRevert(uint x) public pure returns (uint) {
    require(x == 42, 'rats!');
    return 2 * x;
  }

  function double(uint x) public pure returns (uint) {
    return 2 * x;
  }

}
