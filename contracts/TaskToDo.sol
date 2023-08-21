// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract TaskToDo {
    enum TaskStatus {Pending, Finished}
    address owner; 
    struct Task {
        string desc;
        TaskStatus status;
    }
    Task[] public tasks;
    constructor() {
        owner = msg.sender;
    }

    function addTask(string memory _desc) public {
        tasks.push(Task(_desc, TaskStatus.Pending));
    }
    
    function markAsFinished(uint256 id) public {
        require(id < tasks.length, "No task has been mentioned");
        tasks[id].status = TaskStatus.Finished;
    }

    function getTaskCount() public view returns (uint256) {
        return tasks.length;
    }

    function getAllTasks() public view returns (Task[] memory) {
        return tasks;
    }

    function getTask(uint256 id) public view returns (string memory, TaskStatus) {
        require(id < tasks.length, "No task has been mentioned");
        return (tasks[id].desc, tasks[id].status);
    }
}
