//
//  StretchyHeaderLayout.swift
//  StretchyHeader
//
//  Created by ikechukwu Michael on 30/12/2018.
//  Copyright © 2018 ikechukwu Michael. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    // we want to modify the attributes of our header component somehow
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader{
                guard let collectionView = collectionView else { return }
                let width = collectionView.frame.width
                let contentOffSetY = collectionView.contentOffset.y
                print(contentOffSetY)
                if contentOffSetY > 0 { return }
                let height = attributes.frame.height - contentOffSetY
                
                attributes.frame = CGRect(x: 0, y: contentOffSetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
