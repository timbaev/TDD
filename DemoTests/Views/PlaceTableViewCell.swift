//
//  PlaceTableViewCell.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    // MARK: - Instance Properties
    
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var ratingLabel: UILabel!
    @IBOutlet fileprivate weak var addressLabel: UILabel!
    @IBOutlet fileprivate weak var openStatusLabel: UILabel!
    
    // MARK: -
    
    var name: String? {
        get {
            return self.nameLabel.text
        }
        
        set {
            self.nameLabel.text = newValue
        }
    }
    
    var rating: String? {
        get {
            return self.ratingLabel.text
        }
        
        set {
            self.ratingLabel.text = newValue
        }
    }
    
    var address: String? {
        get {
            return self.addressLabel.text
        }
        
        set {
            self.addressLabel.text = newValue
        }
    }
    
    var openStatus: String? {
        get {
            return self.openStatusLabel.text
        }
        
        set {
            self.openStatusLabel.text = newValue
        }
    }
}
