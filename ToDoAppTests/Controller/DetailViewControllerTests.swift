//
//  DetailViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Nikita Vesna on 10.12.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import XCTest
@testable import ToDoApp

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testHasTitleLabel() {
        XCTAssertNotNil(sut.titleLbl)
        XCTAssertTrue(sut.titleLbl.isDescendant(of: sut.view))
    }
    
    func testHasDescriptionLabel() {
        XCTAssertNotNil(sut.descriptionLbl)
        XCTAssertTrue(sut.descriptionLbl.isDescendant(of: sut.view))
    }
    
    func testHasDateLabel() {
        XCTAssertNotNil(sut.dateLbl)
        XCTAssertTrue(sut.dateLbl.isDescendant(of: sut.view))
    }
    
    func testHasMapView() {
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
}
