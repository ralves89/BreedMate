//
//  BreeViewExtension.swift
//  BreedMate
//
//  Created by Renee Alves on 02/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

extension BreedViewController: BreedView {
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func setBreeds(breeds: [Breed]) {
        self.breeds = breeds
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func setEmptyView() {
        tableView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "photoSegue" {
            
            if let destination = segue.destination as? BreedCollectionViewController {
                
                if let breedName = sender as? String {
                    
                    destination.breedName = breedName
                }
            }
        }
    }
}
