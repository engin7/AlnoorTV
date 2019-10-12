//
//  ReposSortingTest.swift
//  AlnoorTVTests
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import XCTest
@testable import AlnoorTV

class ReposSortingTest: XCTestCase {
    
    var mockRepos = [RepoModel.init(description: "An access control to plug-in", stargazers_count: 58, language: "Ruby"),
                     RepoModel.init(description: "A way easy to use CollectionView", stargazers_count: 1280, language: "Swift"),
                     RepoModel.init(description: "Integrating back-end models to client models", stargazers_count: 68, language: "Java"),
                     RepoModel.init(description: "Go to the moon", stargazers_count: 68, language: "Swift"),
                     RepoModel.init(description: "Embed Objective - C to Swift", stargazers_count: 0, language: "Swift")
    ]

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSortReposByRating() {
        let extracted = ContentAnalyzer().sortReposByRating(repos: mockRepos)
        let expected = [
        RepoModel.init(description: "A way easy to use CollectionView", stargazers_count: 1280, language: "Swift"),
        RepoModel.init(description: "Integrating back-end models to client models", stargazers_count: 68, language: "Java"),
        RepoModel.init(description: "Go to the moon", stargazers_count: 68, language: "Swift"),
        RepoModel.init(description: "An access control to plug-in", stargazers_count: 58, language: "Ruby"),
        RepoModel.init(description: "Embed Objective - C to Swift", stargazers_count: 0, language: "Swift")
        ]
        XCTAssertEqual(extracted, expected, "Failed to extract users with any text")
    }
}
