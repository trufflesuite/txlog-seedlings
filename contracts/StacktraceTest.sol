//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract StacktraceTest {

  Boom boom = new Boom();
  event Num(uint);
  function(bool) internal run0;

  function() internal zero;

  constructor(uint x) payable {
    if(x == 1) {
      selfdestruct(payable(tx.origin));
    }
    assert(x == 0);
  }

  function fail(uint fnId) public {
    function(bool) internal[12] memory run0s = [
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
      run0s[fnId](false);
    }
    emit Num(101);
  }

  function run(uint fnId) public {
    function(bool) internal[12] memory run0s = [
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
      run0 = run0s[fnId];
      this.run2(true);
      this.run3(false);
    }
    emit Num(1);
  }

  function run3(bool succeed) public {
    run2(succeed);
  }

  function run2(bool succeed) public {
    run1(succeed);
  }

  function run1(bool succeed) public {
    run0(succeed);
  }

  function runAssert(bool succeed) public {
    assert(succeed);
    emit Num(1);
  }

  function runRequire(bool succeed) public {
    require(succeed);
    emit Num(1);
  }

  function runRequireMessage(bool succeed) public {
    require(succeed, "Eureka!");
    emit Num(1);
  }

  function runDivide(bool succeed) public {
    if(!succeed) {
      uint x = 0;
      emit Num(1/x);
    }
  }

  function runPay(bool succeed) public {
    if(!succeed) {
      payable(address(this)).transfer(1);
    }
  }

  function runCantPay(bool succeed) public {
    if(!succeed) {
      this.payHere{value: address(this).balance + 1}();
    }
  }

  function payHere() public payable {
  }

  function runBoom(bool succeed) public {
    if(!succeed) {
      emit Num(boom.boom());
    }
  }

  function runOutOfGas(bool succeed) public {
    if(!succeed) {
      this.runOutOfGas(false);
    }
  }

  function runExternal(bool succeed) public {
    function() external garbage;
    if(!succeed) {
      garbage();
    }
  }

  function runInternal(bool succeed) public {
    function() internal garbage;
    if(!succeed) {
      garbage();
    }
  }

  function runInternalZero(bool succeed) public {
    if(!succeed) {
      zero();
    }
  }

  function runIndex(bool succeed) public {
    uint[] memory nums = new uint[](0);
    if(!succeed) {
      emit Num(nums[1]);
    }
  }
}

contract Boom {
  function boom() public returns (uint) {
    selfdestruct(payable(address(this)));
    return 0;
  }

  receive() external payable{
  }
}
