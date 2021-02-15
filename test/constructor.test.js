const should = require('chai').should();

const ConstructorNoCtr = artifacts.require("ConstructorNoCtr");
const ConstructorWithCtr = artifacts.require("ConstructorWithCtr");
const GuestBook = artifacts.require("GuestBook");

// first(second.address);
const Second = artifacts.require("Second");
const First = artifacts.require("First");

const zeroAdd = '0x' + '0'.repeat(40);

contract("Constructors", async function ([owner, ..._accounts]) {

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

  it("takes a struct as a parameter", async () => {
    const gb = await GuestBook.new();
    should.not.equal(gb.address, zeroAdd);

    const message = 'Welcome';
    await gb.setNote(message, {from: owner});
    const note = await gb.note();
    console.log(note);

    // should.not.equal(second.address, zeroAdd);
  });



});

