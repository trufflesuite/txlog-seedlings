const Insurance = artifacts.require("Insurance");
const Beneficiary = artifacts.require("Beneficiary");

describe("Insurance", function () {
  let insurance;
  let beneficiaries;
  let owner, accounts;

  before(async () => {
    [owner, accounts] = await web3.eth.getAccounts();
    insurance = await Insurance.new();

    await web3.eth.sendTransaction({from: owner, to: insurance.address, value: 2e18});

    beneficiaries = [];
    for (let i=0; i<7; i++) {
      let b = await Beneficiary.new();
      await insurance.register(b.address, {from: owner});
      beneficiaries.push(b);
    }
  });

  describe("Insurance tests", function() {

    it("pays out", async () => {
      const funds = 5000;
      await insurance.payout(funds);
      const balances = await Promise.all(beneficiaries.map(b => web3.eth.getBalance(b.address))) ;
      balances.forEach((b, i) => assert.equal(b, funds));
    });

  });
});
