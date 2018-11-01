//
//  FollowDataSource.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/1.
//

import UIKit

struct FollowPublisher: Codable {
    var name:String!
    var avatar:String!

}

struct FollowVideoItem: Codable {
    var cover:String!
    var videoId:String!

}
struct FollowListItem: Codable {
    var title:String!
    var desc:String!
    var type:Int;
    var images:[String]!
    var video:FollowVideoItem!
    var publisher:FollowPublisher!
    
    func cellClassName() -> String {
        switch type {
        case 1:
            return "FollowBaseCell"
        case 2:
            return "FollowImageCell"
        case 3:
            return ""
        default:
            return "FollowBaseCell"
        }
    }
    
}

struct FollowListResponse: Codable {
    var code:Int?
    var msg:String?
    var data:[FollowListItem]!
}


class FollowDataSource: NSObject {

    func getFollowList(page: Int,  completion:(_ discoverylist: Any) -> Void) {
        if let path = Bundle.main.path(forResource: "Follow_List", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let response = try JSONDecoder().decode(FollowListResponse.self, from: data)
                
                completion(response)
                
            }catch{
                
            }
        }

    }
}
