//
//  HeadViewCell.swift
//  StretchyHeader
//
//  Created by ikechukwu Michael on 30/12/2018.
//  Copyright © 2018 ikechukwu Michael. All rights reserved.
//

import UIKit

class HeadViewCell: UICollectionReusableView {
    let imageview: UIImageView = {
        let anImage = UIImageView(image: UIImage(named: "gettyimages"))
        anImage.contentMode = .scaleAspectFill
        return anImage
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        fillViewConstraint(customView: imageview)
        setUpVisualEffect()
    }
    var animator: UIViewPropertyAnimator!
    
    func setUpVisualEffect() {
        // TODO
        animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self?.fillViewConstraint(customView: visualEffectView)
        })
     
    }
    
    func fillViewConstraint(customView: UIView) {
        addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        customView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        customView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
