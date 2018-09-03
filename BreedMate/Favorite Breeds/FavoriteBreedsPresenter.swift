//
//  FavoriteBreedsPresenter.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

class FavoriteBreedsPresenter {
    
    weak private var favoriteBreedsView: FavoriteBreedsView?
    
    func attachView(view: FavoriteBreedsView){
        self.favoriteBreedsView = view
    }
    
    func detachView(){
        self.favoriteBreedsView = nil
    }
    
    func getFavoriteBreeds() {
        
        let favoriteBreeds = FavoritesHandler().getFavorites()
        
        if favoriteBreeds.count > 0 {
            
            self.favoriteBreedsView?.setFavorites(breedsArray: favoriteBreeds)
        } else {
            self.favoriteBreedsView?.setEmptyView()
        }
    }
    
    func fetchForStoredImages(breedName: String) -> Int {
        
        let quantity = CustomImageCache().checkIfHasImageStored(breedName: breedName)
        
        if quantity > 0 {
            
            return quantity
        } else {
            
            self.favoriteBreedsView?.showErrorMessage()
            return 0
        }
    }
}
