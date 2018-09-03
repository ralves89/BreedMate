//
//  FavoriteViewController.swift
//  BreedMate
//
//  Created by Renee Alves on 01/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let favoriteBreedsPresenter = FavoriteBreedsPresenter()
    var favoriteBreeds = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteBreedsPresenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favoriteBreedsPresenter.getFavoriteBreeds()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
}
