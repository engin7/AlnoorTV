//
//  AlnoorTVTests.swift
//  AlnoorTVTests
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import XCTest
@testable import AlnoorTV

class AlnoorTVUserFilterTests: XCTestCase {

    let mockUsers = [UserModel.init(login: "Onur", id: 0, avatar_url: ""),
    UserModel.init(login: "Ahmet bitbucket", id: 1, avatar_url: ""),
    UserModel.init(login: "Mehmet github", id: 2, avatar_url: ""),
    UserModel.init(login: "Onur Yıldırım", id: 3, avatar_url: ""),
    UserModel.init(login: "Onur github", id: 4, avatar_url: "")]
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFilterUsersWithText() {
        let extracted = ContentAnalyzer().filterUsers(users: mockUsers, text: "hub")
        let expected = [2, 4]
        XCTAssertEqual(extracted, expected, "Failed to extract users with any text")
    }

    func testFilterUsersWthEmptyText() {
        let extracted = ContentAnalyzer().filterUsers(users: mockUsers, text: "")
        let expected = [0, 1, 2, 3, 4]
        XCTAssertEqual(extracted, expected, "Failed to extract users with empty text")
    }
    
    func testFilterUsersWthSpaceText() {
        let extracted = ContentAnalyzer().filterUsers(users: mockUsers, text: " ")
        let expected = [1, 2, 3, 4]
        XCTAssertEqual(extracted, expected, "Failed to extract users with space character")
    }
    
    func testFilterUsersCaseSensitive() {
        let extracted = ContentAnalyzer().filterUsers(users: mockUsers, text: "onur")
        let expected = [Int]()
        XCTAssertEqual(extracted, expected, "Failed to extract users with case sensitive characters")
    }
}
