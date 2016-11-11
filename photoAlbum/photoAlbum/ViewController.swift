//
//  ViewController.swift
//  photoAlbum
//
//  Created by Minh Pham on 11/11/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import Photos

class ViewController: UICollectionViewController {
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        grabPhotos()
    }
    
    
    func grabPhotos(){
        let imgManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        if let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions){
            if fetchResult.count > 0{
                for i in 0..<fetchResult.count{
                    imgManager.requestImage(for: fetchResult.object(at: i), targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: requestOptions, resultHandler: {
                        
                      image, error in
                        self.imageArray.append(image!)
                        
                    })
                }
            } else {
                print("No photos")
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        var imageView = cell.viewWithTag(1) as! UIImageView
        
        imageView.image = imageArray[indexPath.row]
        
        return cell
    }

}

