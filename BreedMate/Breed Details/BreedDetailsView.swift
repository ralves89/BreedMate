//
//  BreedDetailsView.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol BreedDetailsView: BasicProtocol {
    
    func getBreedName() -> String
    func setURLs(imagesURLs: [String])
}
