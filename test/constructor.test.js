const should = require('chai').should();

const ConstructorNoCtr = artifacts.require("ConstructorNoCtr");
const ConstructorWithCtr = artifacts.require("ConstructorWithCtr");

// first(second.address);
const Second = artifacts.require("Second");
const First = artifacts.require("First");

const zeroAdd = '0x' + '0'.repeat(40);

contract("Constructors", async function (_accounts) {

  it("deploys a contract WITHOUT a constructor function", async () => {
    const instance = await ConstructorNoCtr.new();
    should.not.equal(instance.address, zeroAdd);
  });

  it("deploys a contract WITH a constructor function", async () => {
    const instance = await ConstructorWithCtr.new();
    should.not.equal(instance.address, zeroAdd);
  });

  it("takes a contract as a parameter", async () => {
    const second = await Second.new();
    const first = await First.new(second.address);
    should.not.equal(first.address, zeroAdd);
    should.not.equal(second.address, zeroAdd);
  });



});

