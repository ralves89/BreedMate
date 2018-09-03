//
//  FavoriteDetailsExtension.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

extension FavoriteDetailsCollectionViewController: FavoriteDetailsView {
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func setImages(imagesArray: [UIImage]) {
        self.images = imagesArray
        self.collectionView?.reloadData()
    }

}
