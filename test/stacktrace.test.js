const StacktraceTest = artifacts.require("StacktraceTest");

contract("StacktraceTest", function (accounts) {
  it("succeeds", async function () {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(12);
  });

  it("fails! hahahaha", async function () {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(2); // oops!
  });

  it("fails, try to transfer to self", async function () {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(4);
  });

  it("fails, invokes public payable method with balance+1 funds", async function () {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(5);
  });

  it("fails on deployment, asserts out", async function () {
    await StacktraceTest.new(2);
  });

  it("SDs on deployment!", async function () {
    await StacktraceTest.new(1);
  });
});
