const Entry = artifacts.require("Entry");
const First = artifacts.require("First");
const Second = artifacts.require("Second");

contract("Entry", async function (accounts) {
  let instance;
  before(async () => {
    instance = await Entry.deployed();
  });

  it("tests a call twice: x -> 2(2x + 1) + 1", async () => {
    const tx = await instance.test_a_call_twice(9);
    assert.equal(await instance.value(), 11);
  });


  it("tests a call: x -> 2x + 1", async () => {
    await instance.test_a_call(9);
    assert.equal(await instance.value(), 10);
  });

  it("reverts an entire transaction", async () => {
    const originalValue = (await instance.value()).toNumber();
    try {
      await instance.test_a_revert(9);
    } catch(err) {
      assert.equal(true, true);
    }
    assert.equal(await instance.value(), originalValue);
  });

  it("catches a revert", async () => {
    await instance.test_a_catch(3);
    assert.equal(await instance.value(), 5);
  });
});
