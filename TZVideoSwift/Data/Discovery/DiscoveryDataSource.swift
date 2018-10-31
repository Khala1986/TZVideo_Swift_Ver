//
//  DiscoveryDataSource.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/31.
//

import Foundation

struct DiscoveryPublisher: Codable {
    var name:String!
    var avater:String!
}

struct DiscoveryListItem: Codable {
    var title:String!
    var cover:String!
    var videoId:String!
    var duration:String!
    var publisher:DiscoveryPublisher!
}

struct DiscoveryListResponse: Codable {
    var code:Int?
    var msg:String?
    var data:[DiscoveryListItem]!
}

class DiscoveryDataSource: NSObject{
    func getDiscoveryList(page: Int,  completion:(_ discoverylist: Any) -> Void)  {
        
        if let path = Bundle.main.path(forResource: "Discovery_List", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let response = try JSONDecoder().decode(DiscoveryListResponse.self, from: data)
                
                completion(response)
                
            }catch{
                
            }
        }
        
    }

}
