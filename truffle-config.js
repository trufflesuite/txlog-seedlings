module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
    },
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  /*
  TODO: investigate
  Truffle test fails if solidty version is set to 0.8.0
  > Compiling ./test/TestMultipleGuardedFunctionsOneStack.sol

TypeError: Explicit type conversion not allowed from "int256" to "uint8".
   --> truffle/AssertInt.sol:247:30:
    |
247 |             bts[i++] = _utoa(uint8(n % radix)); // Turn it to ascii.
    |                              ^^^^^^^^^^^^^^^^

,TypeError: Explicit type conversion not allowed from "int256" to "uint8".
   --> truffle/AssertIntArray.sol:176:30:
    |
176 |             bts[i++] = _utoa(uint8(n % radix)); // Turn it to ascii.
    |                              ^^^^^^^^^^^^^^^^
  */
  xyzcompilers: {
    solc: {
      version: "0.8.0",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    }
  },
  plugins: [
    'txlog-to-plantuml'
  ]
};
