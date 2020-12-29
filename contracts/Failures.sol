//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Failures {

  PakSau boom = new PakSau();
  event Num(uint);
  function() internal run0;

  function() internal zero;

  constructor(uint x) payable {
    if(x == 1) {
      selfdestruct(payable(tx.origin));
    }
    assert(x == 0);
  }

  function fail(uint fnId) public {
    function() internal[12] memory run0s = [
      runAssert,         // 0
      runRequire,        // 1
      runRequireMessage, // 2
      runDivide,         // 3
      runPay,            // 4
      runCantPay,        // 5
      runBoom,           // 6
      runOutOfGas,       // 7
      runExternal,       // 8
      runInternal,       // 9
      runInternalZero,   // A
      runIndex           // B
    ];

    if(fnId < run0s.length) {
      run0s[fnId]();
    }
    emit Num(101);
  }

  function runAssert() pure public {
    assert(false);
  }

  function runRequire() pure public {
    require(false);
  }

  function runRequireMessage() pure public {
    require(false, "Eureka!");
  }

  function runDivide() public {
    uint x = 0;
    emit Num(1/x);
  }

  function runPay() public {
    payable(address(this)).transfer(1);
  }

  function runCantPay() public {
    this.payHere{value: address(this).balance + 1}();
  }

  function payHere() public payable { }

  function runBoom() public {
    emit Num(boom.boom());
  }

  function runOutOfGas() public {
    this.runOutOfGas();
  }

  function runExternal() public {
    function() external garbage;
    garbage();
  }

  function runInternal() public {
    function() internal garbage;
    garbage();
  }

  function runInternalZero() public {
    zero();
  }

  function runIndex() public {
    uint[] memory nums = new uint[](0);
    emit Num(nums[1]);
  }
}

contract PakSau {
  function boom() public returns (uint) {
    selfdestruct(payable(address(this)));
    return 0;
  }

  receive() external payable{
  }
}
