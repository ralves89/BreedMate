//
//  BreedView.swift
//  BreedMate
//
//  Created by Renee Alves on 02/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol BreedView: BasicProtocol {
    
    func setBreeds(breeds: [Breed])
    func setEmptyView()
}
