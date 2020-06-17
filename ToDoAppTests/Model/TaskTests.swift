//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Nikita Vesna on 16.06.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleItSets() {
        let task = Task(title: "Foo")
        
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testGivenDescriptionSets(){
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertEqual(task.description, "Bar")
    }
    
    func testTaskInitsWithDate() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task.date)
    }
    
    func testInitTaskWithTitleAndLocation() {
        let location = Location(name: "Foo")
        
        let task = Task(title: "Bar",
                        description: "Baz",
                        location: location)
        
        XCTAssertEqual(location, task.location)
    }
}
