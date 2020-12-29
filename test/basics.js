const Entry = artifacts.require("Entry");
const First = artifacts.require("First");
const Second = artifacts.require("Second");

contract("Entry", async function (_accounts) {
  let instance;

  before(async () => {
    const second = await Second.new();
    const first = await First.new(second.address);
    instance = await Entry.new(first.address);
  });

  it("creates subjects for the test", async () => {
    const second = await Second.new();
    const first = await First.new(second.address);
    instance = await Entry.new(first.address);
  });

  it("tests a call: x -> x + 1", async () => {
    await instance.test_a_call(9);
    assert.equal(await instance.value(), 10);
  });

  it("tests a call twice: x -> x + 2", async () => {
    await instance.test_a_call_twice(9);
    assert.equal(await instance.value(), 11);
  });

  it("reverts an entire transaction", async () => {
    const originalValue = (await instance.value()).toNumber();
    try {
      await instance.test_a_revert(9);
    } catch (err) {
      assert.equal(true, true);
    }
    assert.equal(await instance.value(), originalValue);
  });

  it("catches a revert: x -> x + 2", async () => {
    await instance.test_a_catch(3);
    assert.equal(await instance.value(), 5);
  });

  it("deploys with ETH", async () => {
    const sec = await Second.new({ value: 5000, from: _accounts[1] });
    const secBalance = await web3.eth.getBalance(sec.address);
    assert.equal(secBalance, "5000");
  });
});
