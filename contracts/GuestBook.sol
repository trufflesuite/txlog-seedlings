// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

contract GuestBook {
  struct Note {
    string message;
    address guest;
  }

  Note public note;

  function setNote(string memory message) public returns(string memory reply) {
    note.message = message;
    note.guest = msg.sender;
    return "Secret Message";
  }

}
