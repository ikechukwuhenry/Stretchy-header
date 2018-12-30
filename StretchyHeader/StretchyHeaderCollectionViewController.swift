//
//  StretchyHeaderCollectionViewController.swift
//  StretchyHeader
//
//  Created by ikechukwu Michael on 30/12/2018.
//  Copyright © 2018 ikechukwu Michael. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerIndentifier = "headercell"
private let padding: CGFloat = 16
class StretchyHeaderCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate func setUpCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(HeadViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIndentifier)
    }
    
    fileprivate func setUpLayout() {
        // Do any additional setup after loading the view.
        // custom code
        
        // customize the layout
        if let layout = UICollectionViewLayout.self as? UICollectionViewFlowLayout {
            
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 15
            
        }
    }
      var headerView: HeadViewCell?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUpCollectionView()
        
        
        
    }  // end of viewDidLoad
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIndentifier, for: indexPath) as? HeadViewCell
        return headerView!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 340)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .black
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: view.frame.width - ( 2 * padding), height: 50)
    }
  
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
        
    }
  
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffSetY = scrollView.contentOffset.y
        print(contentOffSetY)
        if contentOffSetY > 0 {
            headerView?.animator.fractionComplete = 0
            return
            
        }
        headerView?.animator.fractionComplete = abs(contentOffSetY) / 100
        
    }

}
