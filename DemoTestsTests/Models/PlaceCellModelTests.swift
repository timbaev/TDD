//
//  PlaceCellViewModel.swift
//  DemoTestsTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceCellModelTests: XCTestCase {
    
    func testInitializerWithPlace() {
        // arrange
        let expectedName = "Cafe De Latina"
        let expectedAddress = "Bengaluru"
        let expectedRating = 4.8
        let expectedOpenStatus = false
        
        let attributes: [String: Any] = ["name": expectedName, "vicinity": expectedAddress, "rating": expectedRating, "opening_hours": ["open_now": expectedOpenStatus]]
        
        let place = Place(attributes: attributes)
        
        // act
        let placeCellViewModel = PlaceCellModel(place: place)
        
        // assert
        XCTAssertNotNil(placeCellViewModel.name)
        XCTAssertNotNil(placeCellViewModel.address)
        XCTAssertNotNil(placeCellViewModel.rating)
        XCTAssertNotNil(placeCellViewModel.openStatusText)
        
        XCTAssertEqual(placeCellViewModel.name, place.name)
        XCTAssertEqual(placeCellViewModel.address, place.address)
        XCTAssertEqual(placeCellViewModel.rating, place.rating?.description)
        
        guard let openStatus = place.openStatus else {
            return XCTFail()
        }
        
        let openStatusText = openStatus ? "We are open. Hop in now!!" : "Sorry we are closed."
        
        XCTAssertEqual(placeCellViewModel.openStatusText, openStatusText)
    }
}
