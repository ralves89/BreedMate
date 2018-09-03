//
//  FavoriteDetailsCollectionViewController.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import UIKit

private let reuseIdentifier = "favoriteDetailCell"

class FavoriteDetailsCollectionViewController: UICollectionViewController {
    
    var dictionary: [String : AnyObject]!
    var images: [UIImage]!
    
    let favoriteDetailsPresenter = FavoriteDetailsPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        favoriteDetailsPresenter.attachView(view: self)
        favoriteDetailsPresenter.getImages(dictionary: dictionary)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let imageView = UIImageView(frame: cell.contentView.frame)
        imageView.image = self.images[indexPath.row]
        cell.contentView.addSubview(imageView)
    
        return cell
    }
}

extension FavoriteDetailsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100.0, height: 100.0)
    }
}
