// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ReentrancyGuard.sol";
import "./ReentrancyAttack.sol";


contract ReentrancyMock is ReentrancyGuard {

    uint256 public counter;

    constructor(uint initial_value) public {
        counter = initial_value;
    }

    function incrementCount() private {
        counter += 1;
    }

    function incrementCountCb(string calldata /* x */) external nonReentrant {
        incrementCount();
    }

    function countLocalRecursiveGuarded(uint256 n) public nonReentrant {
        if (n > 0) {
            incrementCount();

            // call self again
            countLocalRecursiveGuarded(n - 1);
        }
    }

    // is not guarded
    function countLocalRecursiveVulnerable(uint256 n) public {
        if (n > 0) {
            incrementCount();

            // call self again
            countLocalRecursiveVulnerable(n - 1);
        }
    }

    function countThisRecursive(uint256 n) public nonReentrant {
        if (n > 0) {
            incrementCount();
            // solium-disable-next-line security/no-low-level-calls
            (bool result,) = address(this).call(abi.encodeWithSignature("countThisRecursive(uint256)", n - 1));
            require(result == true);
        }
    }

    // is not guarded
    function countThisRecursiveVulnerable(uint256 n) public {
        if (n > 0) {
            incrementCount();
            // solium-disable-next-line security/no-low-level-calls
            (bool result,) = address(this).call(abi.encodeWithSignature("countThisRecursiveVulnerable(uint256)", n - 1));
            require(result == true);
        }
    }

    function countAndCall(ReentrancyAttack attacker) public nonReentrant {
        incrementCount();
        attacker.callSender();
    }

    function countWithHelperVulnerable(uint256 n) public {
        if (n > 0) {
            countLocalRecursiveVulnerable(n);
        }
    }

    function countWithHelper(uint256 n) public nonReentrant {
        if (n > 0) {
            countLocalRecursiveGuarded(n);
        }
    }
}
