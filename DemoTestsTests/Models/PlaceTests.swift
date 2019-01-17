//
//  PlaceTests.swift
//  DemoTestsTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceTests: XCTestCase {
    
    func testInitializeWithAttributes() {
        // arrange
        let expectedName = "Cafe De Latina"
        let expectedAddress = "Bengaluru"
        let expectedRating = 4.8
        let expectedOpenStatus = false
        
        let attributes: [String: Any] = ["name": expectedName, "vicinity": expectedAddress, "rating": expectedRating, "opening_hours": ["open_now": expectedOpenStatus]]
        
        // act
        let place = Place(attributes: attributes)
        
        // assert
        XCTAssertEqual(place.name, expectedName)
        XCTAssertEqual(place.address, expectedAddress)
        XCTAssertEqual(place.rating, expectedRating)
        XCTAssertEqual(place.openStatus, expectedOpenStatus)
    }
    
}
