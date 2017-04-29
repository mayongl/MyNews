//
//  NewsViewController+CollectionViewDataSource.swift
//  MyNews
//
//  Created by Yong Lin Ma on 27/04/2017.
//  Copyright © 2017 Sixlivesleft. All rights reserved.
//

import UIKit

extension NewsViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsTopCell", for: indexPath)
        
        // Configure the cell
        //let dic = images[indexPath.row]
        //cell.label.text = dic[ImgsKey.title] as? String
        
        return cell
    }
    
}
