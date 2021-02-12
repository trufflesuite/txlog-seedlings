const Insurance = artifacts.require("Insurance");
const Beneficiary = artifacts.require("Beneficiary");

contract("Insurance", async function ([owner, ...accounts]) {
  let insurance;
  let beneficiaries;

  before(async () => {
    insurance = await Insurance.new();
    await web3.eth.sendTransaction({from: owner, to: insurance.address, value: 2e18});

    beneficiaries = [];
    for (let i=0; i<3; i++) {
      let b = await Beneficiary.new();
      await insurance.register(b.address, {from: owner});
      beneficiaries.push(b);
    }
  });

  it("pays out", async () => {
    const funds = 5000;
    const tx = await insurance.payout(funds);
    console.log(`truffle run tx2seq ${tx.tx}`);
    const balances = await Promise.all(beneficiaries.map(b => web3.eth.getBalance(b.address))) ;
    balances.forEach((b, i) => assert.equal(b, funds));
  });

});

