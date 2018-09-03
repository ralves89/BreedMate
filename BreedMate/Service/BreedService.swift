//
//  BreedService.swift
//  BreedMate
//
//  Created by Renee Alves on 02/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class BreedService {
    
    func getBreeds (callback: @escaping ([Breed]) -> Void) {
        
        let url = "https://hidden-crag-71735.herokuapp.com/api/breeds"
        var breeds: [Breed] = []
        
        Alamofire.request(url).validate(statusCode: 200..<300).responseJSON { (response) in
            
            if let json = response.result.value as? [String] {
                json.forEach({ (breedName) in
                    
                    let breed = Breed(name: breedName)
                    breeds.append(breed)
                })
                callback(breeds)
            }
        }
    }
    
    func getBreedImagesURL(breedName: String, callback: @escaping ([String]) -> Void) {
        
        let url = "https://hidden-crag-71735.herokuapp.com/api/\(breedName)/images"
        var imagesURL = [String]()
        
        Alamofire.request(url).validate(statusCode: 200..<300).responseJSON { (response) in
            
            if let json = response.result.value as? [String] {
                json.forEach({ (url) in
                    
                    imagesURL.append(url)
                })
                callback(imagesURL)
            }
        }
    }
    
    func getBreedImage(imageURL: String, breedName: String, imageNumber: Int, quantity: Int, callback: @escaping (UIImage) -> Void) {
        
        Alamofire.request(imageURL).responseImage { (imageResponse) in
            
            if let image = imageResponse.result.value {
                CustomImageCache().addImageToCache(image: image, breedName: breedName, imageNumber: imageNumber, quantity: quantity)
                callback(image)
            }
        }
    }
}
