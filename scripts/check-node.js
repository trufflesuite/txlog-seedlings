const Web3 = require("web3");
const web3 = new Web3("http://localhost:8545");

async function* blocks() {
  let bin = 1;
  while (true) {
    try {
      let block = await web3.eth.getBlock(bin++, true);
      for (const tx of block.transactions) {
        yield (tx.hash);
      }
    } catch (e) {
      // outta here
      break;
    }
  }
}

const misformed = (txn) => {
  const { type, contractName: cn } = txn;
  if (
    ["callinternal", "callexternal"].includes(type) && cn === undefined
  ) {
    return { invalid: true, type: txn.type };
  }

  for (const tx of txn.actions) {
    const result = misformed(tx);
    if (result.invalid) return result;
  }

  return { invalid: false, type: txn.type };
};

const main = async () => {
  const txDebuggerDidNotTrace = [];
  const txWithMissingContractName = [];
  const txns = blocks();
  let txCount = 0;
  for await (tx of txns) {
    txCount++;
    let transaction;
    try {
      const txnModulePath = `${process.cwd()}/uml-output/${tx}`;
      transaction = require(txnModulePath);
      const { invalid, type } = misformed(transaction);
      if (invalid) {
        txWithMissingContractName.push({ tx, txCount, type });
      }
    } catch(err) {
      console.log(err)
      txDebuggerDidNotTrace.push({ tx, txCount });
    }
  }

  return {
    txCount,
    txDebuggerDidNotTrace,
    txWithMissingContractName,
  };
};

const report = (
  { txCount, txDebuggerDidNotTrace, txWithMissingContractName },
) => {
  console.log(`Checked ${txCount} transactions`);

  if (txWithMissingContractName.length) {
    console.log("Generated node with undefined contractName");
    for (const { tx, txCount, type } of txWithMissingContractName) {
      console.log(`\ttx #:${txCount}\t ${tx} type: ${type}`);
    }
  } else {
    console.log("No malformed nodes");
  }

  if (txDebuggerDidNotTrace.length) {
    console.log("Debugger unable to process.");
    for (const { tx, txCount } of txDebuggerDidNotTrace) {
      console.log(`\ttx #:${txCount}\t ${tx}`);
    }
  } else {
    console.log("debugger processed all transactions");
  }
};

main().then(report);
