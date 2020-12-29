const Failures = artifacts.require("Failures");
const truffleAssert = require("truffle-assertions");

contract("Failures", function () {
  let subject;
  before(async () => {
    subject = await Failures.new(0, { value: 100 });
  });

  it("assert", async () => {
    await truffleAssert.reverts(
      subject.fail(0),
      truffleAssert.ErrorType.REVERT,
    );
  });

  it("requires: no message", async () => {
    await truffleAssert.reverts(
      subject.fail(1),
      truffleAssert.ErrorType.REVERT,
    );
  });

  it("requires: a message", async () => {
    await truffleAssert.fails(
      subject.fail(2),
      truffleAssert.ErrorType.REVERT,
      "Eureka!",
    );
  });

  // TODO: txlog gives an error code of: 18. where does that come from?
  it("divides: tries going to the moon", async () => {
    await truffleAssert.fails(
      subject.fail(3),
      truffleAssert.ErrorType.REVERT,
    );
  });

  it("transfer: tries to pay self", async () => {
    await truffleAssert.fails(
      subject.fail(4),
      truffleAssert.ErrorType.REVERT,
    );
  });

  it("transfer: tries to overpay self", async () => {
    await truffleAssert.fails(
      subject.fail(5),
      truffleAssert.ErrorType.REVERT,
    );
  });

  // TODO: should the beneficiary be null in this case?
  it("boom", async () => {
    await truffleAssert.fails(
      subject.fail(6),
      truffleAssert.ErrorType.REVERT,
    );
  });

  it("Out of gas", async () => {
    await truffleAssert.fails(
      subject.fail(7),
      truffleAssert.ErrorType.REVERT,
    );
  });

  // TODO: why does this not get a return code like internal ones?
  it("checks out external garbage", async () => {
    await truffleAssert.fails(
      subject.fail(8),
      truffleAssert.ErrorType.REVERT,
    );
  });

  // TODO: Why does this have a return code of uint 81?
  it("checks out internal garbage", async () => {
    await truffleAssert.fails(
      subject.fail(9),
      truffleAssert.ErrorType.REVERT,
    );
  });

  // TODO: Why does this have a return code of uint 81?
  it("InternalZero: stately", async () => {
    await truffleAssert.fails(
      subject.fail(10),
      truffleAssert.ErrorType.REVERT,
    );
  });

  // TODO: why does this have a return code of uint 50?
  it("Index: out of range", async () => {
    await truffleAssert.fails(
      subject.fail(11),
      truffleAssert.ErrorType.REVERT,
    );
  });

});



/*
const runAssert = 0;
const runRequire = 1;
const runRequireMessage = 2;
const runDivide = 3;
const runPay = 4;
const runCantPay = 5;
const runBoom = 6;
const runOutOfGas = 7;
const runExternal = 8;
const runInternal = 9;
const runInternalZero = A;
const runIndex = B;
*/
