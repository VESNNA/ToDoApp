//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Nikita Vesna on 17.06.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {

    var sut: TaskManager!
    
    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTasks() {
        XCTAssertEqual(sut.doneTasksCount, 0)
    }

    func testAddTaskIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    func testTaskAddIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }
    
    func testCheckTaskAtIndexChangesCounts() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    func testCheckedTaskRemovesFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), secondTask)
    }
    
    func testDoneTaskAddedToCheckedTasks() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        
        let returnedTask = sut.doneTask(at: 0)
        
        XCTAssertEqual(returnedTask, task)
    }
    
    func testRemoveAllResultsCountBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))
        
        sut.checkTask(at: 0)
        sut.removeAll()
        
        XCTAssertTrue(sut.tasksCount == 0)
        XCTAssertTrue(sut.doneTasksCount == 0)
    }
    
    func testAddingSameObjectDoesNotIncrementCoint() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
}
