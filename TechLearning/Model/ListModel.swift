//
//  ListModel.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/24.
//  Copyright © 2017年 zcm. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ListModel {
    var name : String!
    var CHID : String!
    var categoryUrl : String!
    var coverUrl : String!
    
    init(json:JSON) {
        self.name = json["name"].stringValue
        self.CHID = json["CHID"].stringValue
        self.categoryUrl = json["category_url"].stringValue
        self.coverUrl = json["cover_url"].stringValue

    }
}
