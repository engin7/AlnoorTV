//
//  AlnoorTVUITests.swift
//  AlnoorTVUITests
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import XCTest

class AlnoorTVUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialScreen() {
        XCTAssert(app.textFields["searchTextField"].exists)
        XCTAssert(app.tables["List user tableView"].exists)
    }
    
    func testCheckTableViewLoaded() {
        _ = app.textFields["searchTextField"].waitForExistence(timeout: 10)
        XCTAssert(app.textFields["searchTextField"].exists)
        XCTAssert(app.tables["List user tableView"].exists)
        XCTAssert(app.tables.staticTexts.count > 0)
    }
    
    func testTapFirstCell() {
        _ = app.textFields["searchTextField"].waitForExistence(timeout: 10)
        
        let tableView = app.tables["List user tableView"]
        let cell = tableView.cells.element(matching: .cell, identifier: "myCell_0")
        XCTAssert(cell.exists && cell.isHittable)
        cell.tap()
        XCTAssert(app.buttons["Sort by ratings"].exists && app.buttons["Sort by ratings"].isHittable)
    }
}
