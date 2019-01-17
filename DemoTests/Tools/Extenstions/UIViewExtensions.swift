//
//  UIViewExtensions.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 16/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Instance Properties
    
    public static var identifier: String {
        return String(describing: self)
    }
}
