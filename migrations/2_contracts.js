const First = artifacts.require("First");
const Entry = artifacts.require("Entry");
const Second = artifacts.require("Second");
const Insurance = artifacts.require("Insurance");
const Beneficiary = artifacts.require("Beneficiary");

module.exports = async function(deployer) {
  await deployer.deploy(Second);
  await deployer.deploy(First, Second.address);
  await deployer.deploy(Entry, First.address);
};
