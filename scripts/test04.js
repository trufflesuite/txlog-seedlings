const Bar = artifacts.require("Bar");
const Foo = artifacts.require("Foo");

module.exports = async function(callback) {
  const foo = await Foo.deployed();
  let res;
  try {
    res = await foo.tryAndCatchRevert(9);
    console.log('tx hash:', res.tx);  // exception raised before res was assigned :(
    console.log(`truffle run tx2seq ${res.tx} `);
  } catch (error) {
    console.log(error);
    console.log('um... something went wrong');
  } finally {
    callback();
  }
}
