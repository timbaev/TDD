//
//  PlaceCellViewModel.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import Foundation

struct PlaceCellModel: Equatable {
    
    // MARK: - Nested Types
    
    fileprivate enum Constants {
        
        // MARK: - Type Properties
        
        static let openStatusText = "We are open. Hop in now!!"
        static let closeStatusText = "Sorry we are closed."
    }
    
    // MARK: - Instance Properties
    
    var name: String?
    var address: String?
    var rating: String?
    var openStatusText: String?
    
    // MARK: - Initializers
    
    init(place: Place) {
        self.name = place.name
        self.address = place.address
        self.rating = place.rating?.description
        
        if place.openStatus ?? false {
            self.openStatusText = Constants.openStatusText
        } else {
            self.openStatusText = Constants.closeStatusText
        }
    }
}
