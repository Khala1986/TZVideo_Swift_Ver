//
//  HomeDataSource.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/21.
//

import UIKit

class HomeDataSource: NSObject {
    func getChannelList(completion:(_ homelist: Any) -> Void)  {

        if let path = Bundle.main.path(forResource: "Home_Channel_List", ofType: "json"){
            do{
               let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let response = try JSONDecoder().decode(HomeChannelListResponse.self, from: data)
                
                completion(response)
                
            }catch{
                
            }
        }
     
    }
    
        
    func getChannel(getChannel:Int, completion:(Any)->Void)  {
        
        if let path = Bundle.main.path(forResource: "Home_TableView_Response_\(getChannel)", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let response = try JSONDecoder().decode(HomeTemplateResponse.self, from: data)
                
                completion(response)
                
            }catch{
                
            }
        }
        
    }
}
