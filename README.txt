# Todo List Smart Contract

## Overview
This is a Solidity smart contract for a simple Todo List application, built to demonstrate key Ethereum smart contract concepts including enums, structs, mappings, arrays, and events. The contract allows users to create todos, update their status, and retrieve todo details.

## Features

- **Add Todos**: Create new todo items with a unique ID, content, and default `Pending` status.
- **Update Status**: Change the status of a todo to `Pending`, `InProgress`, or `Completed`.
- **Retrieve Todos**: Fetch details of a specific todo by its ID.
- **Event Emission**: Emits a `TodoAdded` event when a new todo is created.
- **Data Storage**: Uses a mapping to store todos and an array to track all todo IDs.

## Concepts Covered

- Enums (`Status`)
- Structs (`Todo`)
- Mappings (`todos`)
- Arrays (`todoIds`)
- Events (`TodoAdded`)
- View vs. state-changing functions

## Prerequisites

- **Solidity Compiler**: Version ^0.8.0
- **Ethereum Development Environment**: Remix, Hardhat, or Truffle
- **Node.js** (optional, for Hardhat/Truffle)
- **MetaMask** (for testing on a testnet)
- **Test Network**: Sepolia, Goerli, or a local blockchain (e.g., Ganache)

## Installation

### Clone the Repository (if applicable)
```bash
git clone <repository-url>
cd todo-list-smart-contract
