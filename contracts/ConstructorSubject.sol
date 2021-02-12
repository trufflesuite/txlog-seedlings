// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ConstructorNoCtr { }

contract ConstructorWithCtr {
  address private _owner ;
  constructor() { _owner = msg.sender; }
}

