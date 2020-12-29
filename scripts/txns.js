const Web3 = require('web3');
const web3 = new Web3('http://localhost:8545');

const blocks = async () => {
  let bin = 1;
  while (true) {
    try {
      let block = await web3.eth.getBlock(bin++, true);
      for (const tx of block.transactions) {
        console.log(tx.hash);
      }
    } catch(e) {
      // outta here
      break
    }
  }
}


blocks().then(() => {
  console.log('done!');
});
