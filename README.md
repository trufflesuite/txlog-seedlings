# txlog-seedlings

Truffle project to test `txlog-to-plantuml`

![Transaction trail](images/pink-panther.jpg)


## Setup

1. Clone txlog-to-plantuml in another folder.
   ```sh
   $ git clone git@github.com:trufflesuite/txlog-to-plantuml.git
   $ yarn
   ```
1. Use yarn link to register txlog-to-plantuml for local node projects
   ```sh
   $ yarn link
   ```
1. In the folder of txlog-seedlings, link to txlog-to-plantuml
   ```sh
   $ yarn link txlog-to-plantuml
   ```
1. Run ganache in another terminal, make sure to use the
   `--noVMErrorsOnRPCResponse` flag. For your convenience there's a script.

   ```sh
   $ yarn ganache
   ```
1. Migrate the contracts.
   ```sh
   $ truffle migrate --reset
   ```
1. Seed one or more transactions depending on your needs. The output of the
   exec script will give you the full command you need to execute; and you're
   off the races.
   ```sh
   $ truffle exec scripts/test01.js
   truffle run tx2seq 0x9ad55ccdbea38485dc37e50dc63dd5547ad91b14d3b176b0d196d8b10967e78c
   ```

## TODO
1. More test scripts will be needed and it should be documented here.
1. Explain structure of test scripts; maybe
