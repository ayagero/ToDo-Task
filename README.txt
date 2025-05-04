Todo List Smart Contract
Overview
This is a Solidity smart contract for a simple Todo List application, built to demonstrate key Ethereum smart contract concepts including enums, structs, mappings, arrays, and events. The contract allows users to create todos, update their status, and retrieve todo details.
Features

Add Todos: Create new todo items with a unique ID, content, and default Pending status.
Update Status: Change the status of a todo to Pending, InProgress, or Completed.
Retrieve Todos: Fetch details of a specific todo by its ID.
Event Emission: Emits a TodoAdded event when a new todo is created.
Data Storage: Uses a mapping to store todos and an array to track all todo IDs.

Concepts Covered

Enums (Status)
Structs (Todo)
Mappings (todos)
Arrays (todoIds)
Events (TodoAdded)
View vs. state-changing functions

Prerequisites

Solidity Compiler: Version ^0.8.0
Ethereum Development Environment: Remix, Hardhat, or Truffle
Node.js (optional, for Hardhat/Truffle)
MetaMask (for testing on a testnet)
Test Network: Sepolia, Goerli, or a local blockchain (e.g., Ganache)

Installation

Clone the Repository (if applicable):git clone <repository-url>
cd todo-list-smart-contract


Set Up Development Environment:
Remix: Open Remix IDE (https://remix.ethereum.org) and create a new file named TodoList.sol.
Hardhat:npm install --save-dev hardhat
npx hardhat init

Copy the TodoList.sol contract into the contracts/ directory.
Truffle:npm install -g truffle
truffle init

Copy the contract into the contracts/ directory.


Compile the Contract:
In Remix: Select Solidity compiler version ^0.8.0 and click "Compile".
In Hardhat: Run npx hardhat compile.
In Truffle: Run truffle compile.



Deployment

Deploy on Remix:
Select the "Deploy & Run Transactions" tab.
Choose an environment (e.g., JavaScript VM or Injected Web3 for testnets).
Click "Deploy" and confirm the transaction in MetaMask (if using a testnet).


Deploy with Hardhat:
Create a deployment script in scripts/deploy.js:const hre = require("hardhat");

async function main() {
  const TodoList = await hre.ethers.getContractFactory("TodoList");
  const todoList = await TodoList.deploy();
  await todoList.deployed();
  console.log("TodoList deployed to:", todoList.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


Update hardhat.config.js with testnet details and run:npx hardhat run scripts/deploy.js --network <network-name>




Deploy with Truffle:
Create a migration script in migrations/2_deploy_contracts.js:const TodoList = artifacts.require("TodoList");
module.exports = function (deployer) {
  deployer.deploy(TodoList);
};


Run truffle migrate --network <network-name>.



Usage
Once deployed, interact with the contract using Remix, a frontend (e.g., Web3.js/Ethers.js), or a script. Below are the main functions:

addTodo(string memory _content):
Creates a new todo with the provided content and Pending status.
Example: addTodo("Buy groceries")
Emits TodoAdded(uint id, string content) event.


updateStatus(uint _id, Status _status):
Updates the status of a todo by its ID.
Status values: 0 (Pending), 1 (InProgress), 2 (Completed).
Example: updateStatus(1, 1) (sets todo ID 1 to InProgress).


getTodo(uint _id):
Returns the details (id, content, status) of a todo by its ID.
Example: getTodo(1).



Example Interaction (Remix)

Deploy the contract.
Call addTodo("Finish assignment") to create a todo.
Check the todoIds array to see the new ID (e.g., 1).
Call getTodo(1) to verify the todo details.
Call updateStatus(1, 2) to mark it as Completed.
Check the emitted TodoAdded event in the transaction logs.

Testing
To ensure the contract works as expected, test the following scenarios:

Adding a Todo:
Call addTodo and verify the todo is stored in the todos mapping and its ID is added to todoIds.
Check if the TodoAdded event is emitted with correct id and content.


Updating Status:
Create a todo, then call updateStatus with a valid ID and status.
Verify the status changes using getTodo.
Test with an invalid ID to ensure it reverts with "Todo does not exist".


Retrieving Todos:
Call getTodo with a valid ID and verify the returned data.
Test with an invalid ID to ensure it reverts.



Hardhat Testing Example
Create a test file in test/TodoList.js:
const { expect } = require("chai");

describe("TodoList", function () {
  let TodoList, todoList;

  beforeEach(async function () {
    TodoList = await ethers.getContractFactory("TodoList");
    todoList = await TodoList.deploy();
    await todoList.deployed();
  });

  it("should add a todo", async function () {
    await todoList.addTodo("Test todo");
    const todo = await todoList.getTodo(1);
    expect(todo.content).to.equal("Test todo");
    expect(todo.status).to.equal(0); // Pending
  });

  it("should update status", async function () {
    await todoList.addTodo("Test todo");
    await todoList.updateStatus(1, 1); // InProgress
    const todo = await todoList.getTodo(1);
    expect(todo.status).to.equal(1);
  });

  it("should revert on invalid ID", async function () {
    await expect(todoList.getTodo(999)).to.be.revertedWith("Todo does not exist");
  });
});

Run tests with npx hardhat test.
License
This project is licensed under the MIT License. See the SPDX-License-Identifier: MIT in the contract for details.
Contributing
Feel free to submit issues or pull requests for improvements, such as adding more features (e.g., delete todo, list all todos) or optimizing gas usage.
Contact
For questions or support, reach out to the project maintainers or open an issue in the repository.
