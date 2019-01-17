//
//  PlaceServiceTests.swift
//  DemoTestsTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceServiceTests: XCTestCase {
    
    // MARK: - Instance Properties
    
    fileprivate var jsonPlaceService = JSONPlaceService()
    
    // MARK: - Instance Methods
    
    override func tearDown() {
        self.jsonPlaceService = JSONPlaceService()
        
        super.tearDown()
    }
    
    func testFetch() {
        // arrange
        let jsonData = """
        {
            "results": [
                {
                    "name": "Cafe De Latina",
                    "vicinity": "Bengaluru",
                    "rating": 3.0,
                    "opening_hours": {
                        "open_now": false
                    }
                },
                {
                    "name": "Hotel Taj",
                    "vicinity": "Mumbai",
                    "rating": 4.8,
                    "opening_hours": {
                        "open_now": true
                    }
                }
            ]
        }
        """.data(using: .utf8)
    
        let expectedFirstPlace = Place(attributes: ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 3.0, "opening_hours": ["open_now": false]])
        let expectedSecondPlace = Place(attributes: ["name": "Hotel Taj", "vicinity": "Mumbai", "rating": 4.8, "opening_hours": ["open_now": true]])
        let expectation = self.expectation(description: "Fetch Places")
        
        self.jsonPlaceService.data = jsonData
        
        // act
        var places: [Place] = []
        
        self.jsonPlaceService.fetch(success: { fetchedPlaces in
            places = fetchedPlaces
            
            expectation.fulfill()
        }, error: { message in
            expectation.fulfill()
        })
        
        // assert
        self.waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(places.count, [expectedFirstPlace, expectedSecondPlace].count)
        XCTAssertEqual(places[0], expectedFirstPlace)
        XCTAssertEqual(places[1], expectedSecondPlace)
    }
    
    func testNoData() {
        // arrange
        self.jsonPlaceService.data = nil
        
        let expectation = self.expectation(description: "Fetch Places")
        let expectedMessage = "Data not found"
        
        // act
        var errorMessage: String?
        
        self.jsonPlaceService.fetch(success: { places in
            expectation.fulfill()
        }, error: { message in
            errorMessage = message
            expectation.fulfill()
        })
        
        // assert
        self.waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(errorMessage)
        XCTAssertEqual(errorMessage, expectedMessage)
    }
    
    func testIncorrectJSON() {
        // arrange
        let jsonData = """
        "results": [
            {
                "name": "Cafe De Latina",
                "vicinity": "Bengaluru",
                "rating": 3.0,
                "opening_hours": {
                    "open_now": false
                }
            }
        ]
        """.data(using: .utf8)
        
        let expectedMessage = "There is a problem in fetching places for you."
        let expectation = self.expectation(description: "Fetch Places")
        
        self.jsonPlaceService.data = jsonData
        
        // act
        var errorMessage: String?
        
        self.jsonPlaceService.fetch(success: { places in
            expectation.fulfill()
        }, error: { message in
            errorMessage = message
            expectation.fulfill()
        })
        
        // assert
        self.waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(errorMessage)
        XCTAssertEqual(errorMessage, expectedMessage)
    }
    
    func testIncorrectResultsJSON() {
        // arrange
        let jsonData = """
        {
            "array": [
                {
                    "name": "Cafe De Latina",
                    "vicinity": "Bengaluru",
                    "rating": 3.0,
                    "opening_hours": {
                        "open_now": false
                    }
                },
                {
                    "name": "Hotel Taj",
                    "vicinity": "Mumbai",
                    "rating": 4.8,
                    "opening_hours": {
                        "open_now": true
                    }
                }
            ]
        }
        """.data(using: .utf8)
        
        self.jsonPlaceService.data = jsonData
        
        let expectedMessage = "Results not found"
        let expectation = self.expectation(description: "Fetch Places")
        
        // act
        var errorMessage: String?
        
        self.jsonPlaceService.fetch(success: { places in
            expectation.fulfill()
        }, error: { message in
            errorMessage = message
            expectation.fulfill()
        })
        
        // assert
        self.waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(errorMessage)
        XCTAssertEqual(errorMessage, expectedMessage)
    }
}
