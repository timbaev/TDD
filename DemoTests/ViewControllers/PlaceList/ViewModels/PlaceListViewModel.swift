//
//  PlaceListViewModel.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 16/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import Foundation

class PlaceListViewModel {
    
    // MARK: - Instance Properties
    
    fileprivate var placeService: PlaceService
    
    fileprivate var datasource: [PlaceCellModel] = []
    
    fileprivate var dataModel: [Place]! {
        didSet {
            self.configureDatasource()
            self.configureProperties()
        }
    }
    
    // MARK: -
    
    fileprivate(set) var numberOfRows = 0
    fileprivate(set) var showError: ((String) -> ())?
    
    // MARK: -
    
    var viewDidLoad: (() -> ())?
    
    // MARK: - Instance Methods
    
    fileprivate func configureDatasource() {
        self.datasource = self.dataModel.map { PlaceCellModel(place: $0) }
    }
    
    fileprivate func configureProperties() {
        self.numberOfRows = self.datasource.count
    }
    
    // MARK: -
    
    fileprivate func fetchPlaces() {
        self.placeService.fetch(success: { places in
            self.dataModel = places
        }, error: { message in
            self.showError?(message)
        })
    }
    
    // MARK: -
    
    func placeCellModel(at indexPath: IndexPath) -> PlaceCellModel {
        return self.datasource[indexPath.row]
    }
    
    // MARK: - Initializers
    
    init(placeService: PlaceService) {
        self.placeService = placeService
        
        self.viewDidLoad = { [unowned self] in
            self.fetchPlaces()
        }
    }
}
