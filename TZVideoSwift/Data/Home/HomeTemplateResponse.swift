//
//  HomeTemplateResponse.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/21.
//

import UIKit
import JSONModel

struct HomeTemplateData: Codable {
    var img:String!
    var title:String!
    var subTitle:String!
    var videoId:String!
}

struct HomeTemplateItem: Codable {
    var templateName:String!
    var templateData:[HomeTemplateData]
}

struct HomeTemplateResponse: Codable {
    var code:Int?
    var msg:String?
    var data:[HomeTemplateItem]
}

struct HomeChannelList: Codable {
    var channelName:String?
    var channelId:Int?
}

struct HomeChannelListResponse: Codable {
    var code:Int?
    var msg:String?
    var data:[HomeChannelList]!

}
