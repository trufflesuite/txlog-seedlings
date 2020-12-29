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
1. Run tests
   ```sh
   $ truffle test <testfile>
   ```
1. Generate diagrams
   ```sh
   $ yarn md
   $ mv test.md <testfile>.md # otherwise it will be over-written
   ```
1. kill the ganache process and return to step 4, choosing to run a different
   <testfile>. This is because of Truffle's clean room
