//
//  MainTabBarController.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/14.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBar.sakura.barTintColor()("App.TabBarBarTintColor")
        self.tabBar.sakura.tintColor()("App.TabBarTintColor")
        let titlesArr = ["首页", "发现", "关注", "我的"];
        let imagesArr = ["tabbar_home", "tabbar_discovery", "tabbar_follow", "tabbar_usercenter"];

        self.viewControllers = [TZNavigationController (rootViewController: HomeViewController()), TZNavigationController (rootViewController: DiscoveryViewController()), TZNavigationController (rootViewController: FollowViewController()), TZNavigationController (rootViewController: UserCenterViewController())];
        let last = (self.viewControllers?.count)! - 1
        for index in 0...last {
            let navi = self.viewControllers![index] as! TZNavigationController
            navi.tabBarItem.title = titlesArr[index];
            navi.tabBarItem.image = UIImage (imageLiteralResourceName: imagesArr[index])
            navi.navigationBar.sakura.barTintColor()("App.NavigationBarBarTintColor")
            navi.navigationBar.sakura.tintColor()("App.NavigationBarTintColor")
        }
            
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
