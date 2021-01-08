const RA = artifacts.require('./ReentrancyAttack.sol')
const RG = artifacts.require('./ReentrancyGuard.sol')
const RM = artifacts.require('./ReentrancyMock.sol')

module.exports = function(deployer) {
  deployer.deploy(RA)
  deployer.deploy(RG)
  deployer.deploy(RM, 0)
}
