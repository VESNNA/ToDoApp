//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by Nikita Vesna on 07.12.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskCellTests: XCTestCase {

    var cell: TaskCell!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDownWithError() throws {
        
    }

    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell.titleLbl)
    }
    
    func testCellHasTitleLabelInContentView() {
        XCTAssertTrue(cell.titleLbl.isDescendant(of: cell.contentView))
    }
    
    func testCellHasLocationLabel() {
        XCTAssertNotNil(cell.locationLbl)
    }
    
    func testCellHasLocationLabelInContentView() {
        XCTAssertTrue(cell.locationLbl.isDescendant(of: cell.contentView))
    }
    
    func testCellHasDateLabel() {
        XCTAssertNotNil(cell.dateLbl)
    }
    
    func testCellHasDateLabelInContentView() {
        XCTAssertTrue(cell.dateLbl.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsTitle() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.titleLbl.text, task.title)
    }
    
    func testConfigureSetsLocation() {
        let task = Task(title: "Foo", description: nil, location: Location(name: "Bar"))
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.locationLbl.text, task.location?.name)
    }
    
    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task)
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = df.string(from: date)
        
        XCTAssertEqual(cell.dateLbl.text, dateString)
    }
    
    func configureCellWithTask() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)
    }
    
    func testDoneTaskShouldStrikeThrough() {
        configureCellWithTask()
        
        let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        
        XCTAssertEqual(cell.titleLbl.attributedText, attributedString)
    }
    
    func testDoneTaskDateLabelEqualsNil() {
        configureCellWithTask()
        
        XCTAssertNil(cell.dateLbl)
    }
    
    func testDoneTaskLocationLabelEqualsNil() {
        configureCellWithTask()
        
        XCTAssertNil(cell.locationLbl)
    }
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
