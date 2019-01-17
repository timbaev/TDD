//
//  PlaceService.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import Foundation

protocol PlaceService {
    
    // MARK: - Instance Methods
    
    func fetch(success: @escaping ([Place]) -> (), error: @escaping (String) -> ())
}
