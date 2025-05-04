// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    // 1. Define the Status enum
    enum Status { Pending, InProgress, Completed }
    
    // 2. Define the Todo struct
    struct Todo {
        uint id;
        string content;
        Status status;
    }
    
    // 3. State variables
    mapping(uint => Todo) public todos; // Mapping to store todos by ID
    uint[] public todoIds; // Array to track all todo IDs
    uint private nextId = 1; // Counter for generating unique IDs
    
    // 4. Event for when a todo is added
    event TodoAdded(uint id, string content);
    
    // 5. Function to add a new todo
    function addTodo(string memory _content) public {
        // Create new todo
        Todo memory newTodo = Todo({
            id: nextId,
            content: _content,
            status: Status.Pending
        });
        
        // Store in mapping
        todos[nextId] = newTodo;
        // Add ID to array
        todoIds.push(nextId);
        
        // Emit event
        emit TodoAdded(nextId, _content);
        
        // Increment ID for next todo
        nextId++;
    }
    
    // 6. Function to update todo status
    function updateStatus(uint _id, Status _status) public {
        // Check if todo exists
        require(todos[_id].id != 0, "Todo does not exist");
        
        // Update status
        todos[_id].status = _status;
    }
    
    // 7. Function to get a specific todo
    function getTodo(uint _id) public view returns (Todo memory) {
        // Check if todo exists
        require(todos[_id].id != 0, "Todo does not exist");
        
        return todos[_id];
    }
}