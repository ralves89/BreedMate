//
//  BreedCollectionViewController.swift
//  BreedMate
//
//  Created by Renee Alves on 03/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class BreedCollectionViewController: UICollectionViewController {
    
    var breedName: String!
    var imagesURL = [String]()
    private let breedPresenter = BreedDetailsPresenter(breedService: BreedService())

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.breedPresenter.attachView(view: self)
        self.breedPresenter.getImageURLs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = breedName.capitalized
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imagesURL.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let imageView = UIImageView(frame: cell.contentView.frame)
        let shimmeringView: FBShimmeringView = FBShimmeringView(frame: cell.contentView.frame)
        imageView.image = #imageLiteral(resourceName: "big_dog")
        cell.contentView.addSubview(shimmeringView)
        shimmeringView.contentView = imageView
        shimmeringView.isShimmering = true
        shimmeringView.shimmeringSpeed = 200
        shimmeringView.shimmeringOpacity = 1.0
        
        if let image = breedPresenter.getImageFromCache(breedName: breedName, indexPath: indexPath) {
            
            shimmeringView.isShimmering = false
            imageView.image = image
            
        } else {

            breedPresenter.retrieveImageFrom(imageURL: imagesURL[indexPath.row], breedName: breedName, indexPath: indexPath, imagesQuantity: imagesURL.count, callback: { (image) in
                
                shimmeringView.isShimmering = false
                imageView.image = image
            })
        }
        
        cell.contentView.addSubview(imageView)
    
        return cell
    }
}

extension BreedCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100.0, height: 100.0)
    }
}
