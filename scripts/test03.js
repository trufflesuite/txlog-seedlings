const Bar = artifacts.require("Bar");
const Foo = artifacts.require("Foo");

module.exports = async function(callback) {
  const foo = await Foo.deployed();
  let res;
  try {
    res = await foo.testBarTwiceRevert(9);
  } catch (error) {
    console.log('Yum, consumed expected error');
    // console.log('error: %O', error);
    console.log('tx hash:', error.tx);  // exception raised before res was assigned :(
    console.log(`truffle run tx2seq ${error.tx} `);
  } finally {
    callback();
  }
}

/*

Yum, consumed expected error
error: { StatusError: Transaction: 0xc4450481a5643973f48d29cefcd996e1fa52d40127ad738e301b042f7497c9c6 exited with an error (status 0). Reason given: rats!.
    at module.exports (/Users/cds/dev/test-a-thing/scripts/test03.js:8:21)
    at process._tickCallback (internal/process/next_tick.js:68:7)
  name: 'StatusError',
  tx:
   '0xc4450481a5643973f48d29cefcd996e1fa52d40127ad738e301b042f7497c9c6',
  receipt:
   { transactionHash:
      '0xc4450481a5643973f48d29cefcd996e1fa52d40127ad738e301b042f7497c9c6',
     transactionIndex: 0,
     blockHash:
      '0x211e3129a7c5e8a4bbd785274f81fb6aa12e5bf6f78771fa1a00903c41554ff9',
     blockNumber: 7,
     from: '0xd29d572b86b006b1e5c7b9fb439184fa35a65273',
     to: '0x60d70cecc99603299d2fddc55850fa3dc8b8176a',
     gasUsed: 26840,
     cumulativeGasUsed: 26840,
     contractAddress: null,
     logs: [],
     status: false,
     logsBloom:
      '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
     rawLogs: [] },
  reason: 'rats!',
  hijackedStack:
   'StatusError: Transaction: 0xc4450481a5643973f48d29cefcd996e1fa52d40127ad738e301b042f7497c9c6 exited with an error (status 0). Reason given: rats!.\n     Please check that the transaction:\n     - satisfies all conditions set by Solidity `require` statements.\n     - does not trigger a Solidity `revert` statement.\n\n    at Object.receipt (/Users/cds/.nvm/versions/node/v10.20.1/lib/node_modules/truffle/build/webpack:/packages/contract/lib/handlers.js:128:1)\n    at process._tickCallback (internal/process/next_tick.js:68:7)' }
~/dev/test-a-thing 
*/
