//
//  BreedDetailsViewExtension.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

extension BreedCollectionViewController: BreedDetailsView {
    func getBreedName() -> String {
        return self.breedName
    }
    
    func startLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func setURLs(imagesURLs: [String]) {
        self.imagesURL = imagesURLs
        self.collectionView?.reloadData()
    }
}
