//
//  CollectionViewCell.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/22.
//  Copyright © 2017年 zcm. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var imageView : UIImageView!
    var label : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
//        label.layer.opacity = 0.5
        contentView.addSubview(label)
//        imageView = UIImageView()
//        contentView.addSubview(imageView)
        let red = arc4random() % 255
        let green = arc4random() % 255
        let blue = arc4random() % 255
        let color  = UIColor(red: CGFloat(Double(red) / 255.0), green: CGFloat(Double(green) / 255.0), blue: CGFloat(Double(blue) / 255.0), alpha: 1)
        contentView.backgroundColor = color
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        imageView.frame = contentView.bounds
        label.frame = contentView.bounds
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
