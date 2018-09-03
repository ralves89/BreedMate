//
//  BreedViewController.swift
//  BreedMate
//
//  Created by Renee Alves on 01/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import UIKit

class BreedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    let breedPresenter = BreedsPresenter(breedService: BreedService())
    var breeds = [Breed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        breedPresenter.attachView(view: self)
        breedPresenter.getBreeds()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        breedPresenter.detachView()
    }
}
