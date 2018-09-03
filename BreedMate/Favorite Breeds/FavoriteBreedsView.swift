//
//  FavoriteBreedsView.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol FavoriteBreedsView: BasicProtocol {
    
    func setFavorites(breedsArray: [String])
    func setEmptyView()
    func showErrorMessage()
}
