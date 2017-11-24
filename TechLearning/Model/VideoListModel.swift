//
//  VideoListModel.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/24.
//  Copyright © 2017年 zcm. All rights reserved.
//

import Foundation
import SwiftyJSON

struct VideoListModel {
    var vid : String!
    var uid : String!
    var title : String!
    var keyword : String!
    var channel : String!
    var duration : String!
    
    var videoUrl : String!
    var previewUrl : String!
    var hd : Bool
    
    init(json:JSON) {
        self.uid = json["uid"].stringValue
        self.vid = json["vid"].stringValue
        self.title = json["title"].stringValue
        self.keyword = json["keyword"].stringValue
        self.channel = json["channel"].stringValue
        self.duration = json["duration"].stringValue
        
        self.videoUrl = json["video_url"].stringValue
        self.previewUrl = json["preview_url"].stringValue
        self.hd = json["hd"].boolValue
    }
}
