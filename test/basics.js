const foo = artifacts.require("foo");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("foo", function (/* accounts */) {
  it("should assert true", async function () {
    await foo.deployed();
    return assert.isTrue(true);
  });
});
