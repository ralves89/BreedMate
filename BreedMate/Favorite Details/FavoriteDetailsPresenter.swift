//
//  FavoriteDetailsPresenter.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

class FavoriteDetailsPresenter {
    
    weak private var favoriteDetailsView: FavoriteDetailsView?
    
    func attachView(view: FavoriteDetailsView){
        favoriteDetailsView = view
    }
    
    func detachView(){
        favoriteDetailsView = nil
    }
    
    func getImages(dictionary: Dictionary<String,AnyObject>) {
        
        guard let breedName = dictionary["name"] as? String
            else {return}
        
        guard let quantity = dictionary["quantity"] as? Int
            else {return}
        
        let images = CustomImageCache().getImages(breedName: breedName, quantity: quantity)
        
        favoriteDetailsView?.setImages(imagesArray: images)
    }
}
