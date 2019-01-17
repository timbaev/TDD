//
//  Place.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import Foundation

struct Place: Equatable {
    
    // MARK: - Instance Properties
    
    var name: String?
    var address: String?
    var rating: Double?
    var openStatus: Bool?
    
    // MARK: - Initializers
    
    init(attributes: [String: Any]) {
        self.name = attributes["name"] as? String
        self.address = attributes["vicinity"] as? String
        self.rating = attributes["rating"] as? Double
        
        if let openingHours = attributes["opening_hours"] as? [String: Any] {
            self.openStatus = openingHours["open_now"] as? Bool
        }
    }
}
