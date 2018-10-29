//
//  TZBaseViewController.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/14.
//

import UIKit
import Masonry
class TZBaseViewController: UIViewController {

    lazy var contentView:UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.contentView)
        self.contentView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            if #available(iOS 11.0, *) {
                maker?.left.equalTo()(self.view.mas_safeAreaLayoutGuideLeft)
                maker?.top.equalTo()(self.view.mas_safeAreaLayoutGuideTop)
                maker?.right.equalTo()(self.view.mas_safeAreaLayoutGuideRight)
                maker?.bottom.equalTo()(self.view.mas_safeAreaLayoutGuideBottom)
            }else {
                maker?.leading.trailing().equalTo()(self.view);
                maker?.top.equalTo()(self.mas_topLayoutGuide);
                maker?.bottom.equalTo()(self.mas_bottomLayoutGuide);
            }
        }

        // Do any additional setup after loading the view.
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
