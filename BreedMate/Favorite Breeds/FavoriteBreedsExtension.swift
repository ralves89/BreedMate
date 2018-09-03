//
//  FavoriteBreedsExtension.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

extension FavoriteViewController: FavoriteBreedsView {
    
    func setFavorites(breedsArray: [String]) {
       
        self.favoriteBreeds = breedsArray.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        
        self.tableView.isHidden = false
        self.tableView.reloadData()
    }
    
    func setEmptyView() {
        self.tableView.isHidden = true
    }
    
    func startLoading() {}
    
    func stopLoading() {}
    
    func showErrorMessage() {
        
        let alert = UIAlertController(title: "Error", message: "We're unable to fetch any breed image!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "favoriteSegue" {
            
            if let destination = segue.destination as? FavoriteDetailsCollectionViewController {
                
                destination.dictionary = sender as! [String : AnyObject]
            }
        }
    }
}
