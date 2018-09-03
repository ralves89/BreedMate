//
//  BreedDetailsPresenter.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

class BreedDetailsPresenter {
    
    private let breedService: BreedService
    weak private var breedDetailsView: BreedDetailsView?
    
    init(breedService: BreedService) {
        self.breedService = breedService
    }
    
    func attachView(view: BreedDetailsView){
        breedDetailsView = view
    }
    
    func detachView(){
        breedDetailsView = nil
    }
    
    func getImageURLs() {
        
        self.breedDetailsView?.startLoading()
        let breedName = breedDetailsView?.getBreedName()
        breedService.getBreedImagesURL(breedName: breedName!) { (urls) in
            
            self.breedDetailsView?.stopLoading()
            self.breedDetailsView?.setURLs(imagesURLs: urls)
        }
    }
    
    func retrieveImageFrom(imageURL: String,
                           breedName: String,
                           indexPath: IndexPath,
                           imagesQuantity: Int,
                           callback: @escaping (UIImage) -> Void
        ){
        breedService.getBreedImage(imageURL: imageURL,
                                   breedName: breedName,
                                   imageNumber: indexPath.row,
                                   quantity: imagesQuantity) { (image) in
            
            callback(image)
        }
    }
    
    func getImageFromCache(breedName: String, indexPath: IndexPath) -> UIImage? {
        
        guard let image = CustomImageCache().getImage(identifier: "\(breedName)\(indexPath.row)")
        else {return nil}
        
        return image
    }
}
