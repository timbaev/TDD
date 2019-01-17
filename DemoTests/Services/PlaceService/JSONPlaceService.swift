//
//  JSONPlaceService.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 16/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import Foundation

class JSONPlaceService: PlaceService {
    
    var data: Data?
    
    init() {
        guard let path = Bundle.main.path(forResource: "PlaceList", ofType: "json") else {
            return
        }
        
        self.data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
    
    func fetch(success: @escaping ([Place]) -> (), error: @escaping (String) -> ()) {
        guard let data = self.data else {
            return error("Data not found")
        }
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        
        guard let jsonResult = json as? [String: Any] else {
            return error("There is a problem in fetching places for you.")
        }
        
        guard let results = jsonResult["results"] as? [[String: Any]] else {
            return error("Results not found")
        }
        
        let places = results.map { Place(attributes: $0) }
        
        success(places)
    }
}
