//
//  ImageBrowseCollectionViewFlowLayout.swift
//  MyNews
//
//  Created by Yonglin Ma on 4/24/17.
//  Copyright © 2017 Sixlivesleft. All rights reserved.
//

import UIKit

class ImageBrowseCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.itemSize = CGSize(width: 200, height: 200)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        
        
        
        return attributes
    }

}
