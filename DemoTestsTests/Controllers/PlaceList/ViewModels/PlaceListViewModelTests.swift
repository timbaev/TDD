//
//  PlaceListViewModelTests.swift
//  DemoTestsTests
//
//  Created by Timur Shafigullin on 16/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import XCTest
@testable import DemoTests

fileprivate class MockPlaceService: PlaceService {
    
    // MARK: - Instance Properties
    
    var places: [Place] = []
    
    // MARK: - Instance Methods
    
    func fetch(success: @escaping ([Place]) -> (), error: @escaping (String) -> ()) {
        success(self.places)
    }
    
    // MARK: - Initializers
    
    init() {
        let firstPlace = Place(attributes: ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 3.0, "opening_hours": ["open_now": false]])
        let secondPlace = Place(attributes: ["name": "Hotel Taj", "vicinity": "Mumbai", "rating": 4.8, "opening_hours": ["open_now": true]])
        
        self.places.append(contentsOf: [firstPlace, secondPlace])
    }
}

class PlaceListViewModelTests: XCTestCase {
    
    // MARK: - Instance Properties
    
    fileprivate var placeListViewModel: PlaceListViewModel!
    fileprivate var placeService: PlaceService!
    
    override func setUp() {
        super.setUp()
        
        self.placeListViewModel = PlaceListViewModel(placeService: MockPlaceService())
        self.placeService = MockPlaceService()
        
        self.placeListViewModel.viewDidLoad?()
    }
    
    override func tearDown() {
        self.placeListViewModel = nil
        self.placeService = nil
    }
    
    func testNumberOfRows() {
        // arrange
        let firstPlace = Place(attributes: ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 3.0, "opening_hours": ["open_now": false]])
        let secondPlace = Place(attributes: ["name": "Hotel Taj", "vicinity": "Mumbai", "rating": 4.8, "opening_hours": ["open_now": true]])
        let expectedNumberOfRows = [PlaceCellModel(place: firstPlace), PlaceCellModel(place: secondPlace)].count
        
        // act
        let numberOfRows = self.placeListViewModel.numberOfRows
        
        // assert
        XCTAssertEqual(numberOfRows, expectedNumberOfRows)
    }
    
    func testPlaceCellModelAtIndexPath() {
        // arrange
        let firstPlace = Place(attributes: ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 3.0, "opening_hours": ["open_now": false]])
        let secondPlace = Place(attributes: ["name": "Hotel Taj", "vicinity": "Mumbai", "rating": 4.8, "opening_hours": ["open_now": true]])
        let placeCellModels = [PlaceCellModel(place: firstPlace), PlaceCellModel(place: secondPlace)]
        let index = 1
        let expectedPlaceCellModel = placeCellModels[index]
        
        // act
        let placeCellModel = self.placeListViewModel.placeCellModel(at: IndexPath(row: index, section: 0))
        
        // assert
        XCTAssertEqual(placeCellModel, expectedPlaceCellModel)
    }
}
