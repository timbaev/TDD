//
//  PlaceListTableViewController.swift
//  DemoTests
//
//  Created by Timur Shafigullin on 15/01/2019.
//  Copyright © 2019 Timur Shafigullin. All rights reserved.
//

import UIKit

class PlaceListTableViewController: UIViewController {
    
    // MARK: - Instance Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -
    
    var viewModel = PlaceListViewModel(placeService: Services.placeService)
    
    // MARK: - Instance Methods
    
    func configure(placeCell cell: PlaceTableViewCell, at indexPath: IndexPath) {
        let cellModel = self.viewModel.placeCellModel(at: indexPath)
        
        cell.name = cellModel.name
        cell.address = cellModel.address
        cell.rating = cellModel.rating
        cell.openStatus = cellModel.openStatusText
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.viewDidLoad?()
    }
}

// MARK: - UITableViewDataSource

extension PlaceListTableViewController: UITableViewDataSource {
    
    // MARK: - Instance Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceTableViewCell.identifier, for: indexPath)
        
        self.configure(placeCell: cell as! PlaceTableViewCell, at: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlaceListTableViewController: UITableViewDelegate {
    
    // MARK: - Instance Methods
}
