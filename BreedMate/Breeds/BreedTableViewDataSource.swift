//
//  BreedTableViewDataSource.swift
//  BreedMate
//
//  Created by Renee Alves on 02/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import UIKit

extension BreedViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let breedCell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath) as! BreedCell
        
        if let breed = self.breeds[indexPath.row] as? Breed {
            breedCell.breedName.text = breed.name.capitalized
            
            if breedPresenter.isFavorite(breedName: breed.name.capitalized) {
                
                breedCell.favoriteButton.setImage(#imageLiteral(resourceName: "selected_favorite"), for: .normal)
                breedCell.favoriteButton.tag = 1
            } else {
                
                breedCell.favoriteButton.setImage(#imageLiteral(resourceName: "deselected_favorite_table"), for: .normal)
                breedCell.favoriteButton.tag = 0
            }
        }
        return breedCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let breedName = breeds[indexPath.row].name
        self.performSegue(withIdentifier: "photoSegue", sender: breedName)
    }
}
