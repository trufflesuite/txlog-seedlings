const Bar = artifacts.require("Bar");
const Foo = artifacts.require("Foo");

module.exports = async function(callback) {
  const foo = await Foo.deployed();
  const res = await foo.testBarTwice(9);
  console.log('tx hash:', res.tx);
  console.log(`truffle run tx2seq ${res.tx} `)
  callback();
}
