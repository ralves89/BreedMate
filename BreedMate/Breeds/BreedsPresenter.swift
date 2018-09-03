//
//  BreedsPresenter.swift
//  BreedMate
//
//  Created by Renee Alves on 02/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

class BreedsPresenter {
    
    private let breedService: BreedService
    weak private var breedView: BreedView?
    
    init(breedService: BreedService) {
        self.breedService = breedService
    }
    
    func attachView(view: BreedView){
        self.breedView = view
    }
    
    func detachView(){
        self.breedView = nil
    }
    
    func getBreeds() {
        
        self.breedView?.startLoading()
        breedService.getBreeds { (breeds) in
            
            self.breedView?.stopLoading()
            if breeds.count == 0 {
                self.breedView?.setEmptyView()
            } else {
                
                self.breedView?.setBreeds(breeds: breeds)
            }
        }
    }
    
    func isFavorite(breedName: String) -> Bool {
        
        return FavoritesHandler().isFavorite(breedName: breedName)
    }
}
