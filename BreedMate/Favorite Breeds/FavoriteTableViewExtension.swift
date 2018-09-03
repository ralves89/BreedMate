//
//  FavoriteTableViewExtension.swift
//  BreedMate
//
//  Created by Renee Alves on 01/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import UIKit

extension FavoriteViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteBreedsCell
        
        cell.breedName.text = favoriteBreeds[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteBreeds.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let quantity = favoriteBreedsPresenter.fetchForStoredImages(breedName: favoriteBreeds[indexPath.row])
        let dictionary = ["name" : favoriteBreeds[indexPath.row],
                          "quantity" : quantity] as [String : AnyObject]
            
        self.performSegue(withIdentifier: "favoriteSegue", sender: dictionary)
    }
}
