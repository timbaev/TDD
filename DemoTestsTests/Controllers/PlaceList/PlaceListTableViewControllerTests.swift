//
//  PlaceListTableViewControllerTests.swift
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

class PlaceListTableViewControllerTests: XCTestCase {
    
    // MARK: - Instance Properties
    
    fileprivate var placeListTableViewController: PlaceListTableViewController!
    fileprivate var viewModel: PlaceListViewModel!
    
    // MARK: - Instance Methods
    
    override func setUp() {
        super.setUp()
        
        let viewModel = PlaceListViewModel(placeService: MockPlaceService())
        
        let placeListStoryboard = UIStoryboard(name: "PlaceList", bundle: Bundle.main)
        
        self.placeListTableViewController = placeListStoryboard.instantiateInitialViewController() as? PlaceListTableViewController
        self.placeListTableViewController.viewModel = viewModel
        _ = self.placeListTableViewController.view
    }
    
    func testNumberOfRowsInSection() {
        // arrange
        let expectedNumberOfRows = self.placeListTableViewController.viewModel.numberOfRows
        
        // act
        let numberOfRows = self.placeListTableViewController.tableView(self.placeListTableViewController.tableView, numberOfRowsInSection: 0)
        
        // assert
        XCTAssertEqual(numberOfRows, expectedNumberOfRows)
    }
    
    func testCellForRowAt() {
        // arrange
        let expectedName = "Cafe De Latina"
        let expectedAddress = "Bengaluru"
        let expectedRating = "3.0"
        let expectedOpenStatus = "Sorry we are closed."
        
        // act
        let cell = self.placeListTableViewController.tableView(self.placeListTableViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PlaceTableViewCell
        
        // assert
        XCTAssertEqual(cell.name, expectedName)
        XCTAssertEqual(cell.address, expectedAddress)
        XCTAssertEqual(cell.rating, expectedRating)
        XCTAssertEqual(cell.openStatus, expectedOpenStatus)
    }
}
