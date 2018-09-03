//
//  BreedCell.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import UIKit

class BreedCell: UITableViewCell {
    
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func isFavorite(sender: UIButton) {
    
        if sender.tag == 0 {
            sender.setImage(#imageLiteral(resourceName: "selected_favorite"), for: .normal)
            sender.tag = 1
            FavoritesHandler().storeFavorite(breedName: self.breedName.text!)
        } else {
            sender.setImage(#imageLiteral(resourceName: "deselected_favorite_table"), for: .normal)
            sender.tag = 0
            FavoritesHandler().deleteFavorite(identifier: self.breedName.text!)
        }
    }
}
