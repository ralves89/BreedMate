//
//  ImageCache.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import Kingfisher

class CustomImageCache {

    let userDefaults = UserDefaults.standard
    private let MAX_IMAGES = 5
    
    func addImageToCache(image: UIImage, breedName: String, imageNumber: Int, quantity: Int) {
        
        ImageCache.default.store(image,
                                 original: nil,
                                 forKey: "\(breedName)\(imageNumber)",
                                 toDisk: true)
        
        
        ImageCache.default.store(image, forKey: "\(breedName)\(imageNumber)")
        // Will be used to check if breed has image stored
        userDefaults.set(quantity, forKey: breedName)
    }
    
    func getImage(identifier: String) -> UIImage? {
        
        var retrievedImage: UIImage?
        
        retrievedImage = ImageCache.default.retrieveImageInDiskCache(forKey: identifier)
        
        return retrievedImage
    }
    
    func getImages(breedName: String, quantity: Int) -> [UIImage] {
        
        var images = [UIImage]()
        for i in 0..<quantity {
            
            let identifier = "\(breedName.lowercased())\(i)"
            
            if let image = getImage(identifier: identifier) {
                images.append(image)
            }
            
            if images.count == MAX_IMAGES {
                break
            }
        }
        return images
    }
    
    func checkIfHasImageStored(breedName: String) -> Int {
        
        guard let quantity = userDefaults.integer(forKey: breedName.lowercased()) as? Int
            else {return 0}
        
        return quantity
    }
}
