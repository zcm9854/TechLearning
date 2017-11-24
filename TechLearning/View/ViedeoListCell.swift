//
//  ViedeoListCell.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/24.
//  Copyright © 2017年 zcm. All rights reserved.
//

import UIKit

class ViedeoListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backIMG: UIImageView!
    @IBOutlet weak var hdLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
