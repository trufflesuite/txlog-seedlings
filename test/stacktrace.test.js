const StacktraceTest = artifacts.require("StacktraceTest");

contract("StacktraceTest", function(accounts) {
  it("succeeds", async function() {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(12);
  });
  it("succeeds but fails anyway", async function() {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(12);
    assert(false);
  });
  it("fails! hahahaha", async function() {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(2); //leaves a message
  });
  it("fails with extra info", async function() {
    let instance = await StacktraceTest.new(0, { value: 100 });
    await instance.run(4); //leaves a message
  });
  it("fails on deployment!", async function() {
    await StacktraceTest.new(2);
  });
  it("SDs on deployment!", async function() {
    await StacktraceTest.new(1);
  });

  it("succeeds", async function() {
    let instance = await StacktraceTest.new(0, { value: 100 });
    let deferred = instance.run(12);
    let receipt = await deferred;
  });
});

