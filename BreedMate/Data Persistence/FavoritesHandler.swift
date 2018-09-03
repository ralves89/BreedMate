//
//  FavoritesHandler.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

class FavoritesHandler {
    
    let userDefaults = UserDefaults.standard
    private let key = "favoritesArray"
    
    func getFavorites() -> [String] {
        
        var favorites = [String]()
        
        if let array = userDefaults.array(forKey: key) as? [String] {
            favorites = array
        }
        
        return favorites
    }
    
    func storeFavorite(breedName: String) {
    
        if var favoritesArray = userDefaults.array(forKey: key) as? [String] {
            
            favoritesArray.append(breedName)
            userDefaults.set(favoritesArray, forKey: key)
            
        } else {
            
            var favoritesArray = [String]()
            favoritesArray.append(breedName)
            userDefaults.set(favoritesArray, forKey: key)
        }
        
    }
    
    func deleteFavorite(identifier: String) {
        
        if var favoritesArray = userDefaults.array(forKey: key) as? [String] {
            
            var counter = 0
            for breedName in favoritesArray {
                
                if breedName == identifier {
                    
                    favoritesArray.remove(at: counter)
                }
                counter = counter + 1
            }
            
            userDefaults.set(favoritesArray, forKey: key)
        }
    }
    
    func isFavorite(breedName: String) -> Bool {

        if let favoritesArray = userDefaults.array(forKey: key) as? [String] {
         
            for breed in favoritesArray {
                if breed == breedName { return true}
            }
        }
        
        return false
    }
}
