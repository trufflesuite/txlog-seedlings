const Bar = artifacts.require("Bar");
const Foo = artifacts.require("Foo");
const Spam = artifacts.require("Spam");

module.exports = async function(deployer) {
  await deployer.deploy(Spam);
  await deployer.deploy(Bar, Spam.address);
  await deployer.deploy(Foo, Bar.address);
};
