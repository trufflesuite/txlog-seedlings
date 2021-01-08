# txlog-seedlings

Truffle project to test `txlog-to-plantuml`

![Transaction trail](images/pink-panther.jpg)


## Setup

1. Clone txlog-to-plantuml in another folder and switch to the experimental branch
   ```sh
   $ git clone git@github.com:trufflesuite/txlog-to-plantuml.git
   $ cd txlog-to-plantuml
   $ git checkout experimental
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
1. Run ganache in terminal 2
   ```sh
   $ ganache-cli
   ```
1. Run truffle compile and test in terminal 1
   ```sh
   $ truffle compile
   $ truffle test
   ```
1. Generate the uml files. Coincidently the interesting transaction generates
   the largest plant uml file. First, update the `TRUFFLE` variable in `gen-umls.zsh`
   to resolve to your preferred truffle command. I like to use @gnidan's
   `use-truffle-core` zsh alias. truffle configured... generate the umls
   ```sh
   $ ./gen-umls.zsh
   ```
1. Find the largest puml file (will be the last entry from below command).
   ```sh
   $ ls -S -l *puml | tac
   $ truffle test
   ```

1. The basename of the file is the transaction hash. There should be an
   associated json file with the util.inspect dump of the txLog as well.
