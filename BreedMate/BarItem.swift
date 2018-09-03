//
//  BarItem.swift
//  BreedMate
//
//  Created by Renee Alves on 01/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import UIKit

class BarItem: UITabBarItem {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
                
        if let image = image {
            self.image = image.withRenderingMode(.alwaysOriginal)
        }
        
        if let selectedImage = selectedImage {
            self.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        }
    }
}
