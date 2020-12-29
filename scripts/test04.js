const Bar = artifacts.require("Bar");
const Foo = artifacts.require("Foo");

module.exports = async function(callback) {
  const foo = await Foo.deployed();
  let res;
  try {
    res = await foo.tryAndCatchRevert(9);
  } catch (error) {
    console.log('Yum, consumed expected error');
    console.log('tx hash:', error.tx);  // exception raised before res was assigned :(
    console.log(`truffle run tx2seq ${error.tx} `);
  } finally {
    callback();
  }
}
