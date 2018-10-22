//
//  TZResponse.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/21.
//

import UIKit
import JSONModel

struct HomeChannel: Codable {
    var channelName:String?
    var channelId:Int?
}

struct TZResponse: Codable {
    var code:Int?
    var msg:String?
    var data:[HomeChannel]
}
