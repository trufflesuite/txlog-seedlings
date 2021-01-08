// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";

import "../contracts/ReentrancyMock.sol";
import "../contracts/ReentrancyAttack.sol";


contract TestGuardMultipleFunctions {

    ReentrancyMock private target;

    function beforeAll() public {
        // set initial value to 2
        target = new ReentrancyMock(42);
    }

    function testTargetIsInitialized() public {
        Assert.equal(target.counter(), 42, "counter should be 2");
    }

    function testAnotherFunctionVulnerable() public {
        uint256 expectedValue = target.counter() + 5;
        // try to invoke localRecursion that is reentrant.
        // solhint-disable-next-line
        (bool result,) = address(target).call(abi.encodeWithSignature("countWithHelperVulnerable(uint256)", 5));

        // it does not detect reentrancy
        Assert.isTrue(result, "Does not have a guard");

        // and the counter is not changed
        Assert.equal(target.counter(), expectedValue, "counter incremented by 5");
    }

    function testAnotherFunctionGuarded() public {
        uint256 expectedValue = target.counter();
        // try to invoke localRecursion that is reentrant.
        (bool result,) = address(target).call(abi.encodeWithSignature("countWithHelper(uint256)", 5));

        // it should detect reentrancy and revert
        Assert.isFalse(result, "Guard should prevent reentry");

        // and the counter is not changed
        Assert.equal(target.counter(), expectedValue, "counter should remain unchanged");
    }
}
