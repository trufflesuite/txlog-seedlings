const should = require('chai').should();

const ConstructorNoCtr = artifacts.require("ConstructorNoCtr");
const ConstructorWithCtr = artifacts.require("ConstructorWithCtr");

const zeroAdd = '0x' + '0'.repeat(40);

contract("Entry", async function (_accounts) {

  it("deploys a contract without a constructor function", async () => {
    const instance = await ConstructorNoCtr.new();
    should.not.equal(instance.address, zeroAdd);
  });

  it("deploys a contract without a constructor function", async () => {
    const instance = await ConstructorWithCtr.new();
    should.not.equal(instance.address, zeroAdd);
  });

});

