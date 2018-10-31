//
//  TZErrorView.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/15.
//

import UIKit
import AFNetworking

enum TZErrorViewType: UInt {
    case TZErrorViewType_Unknown = 0
    case TZErrorViewType_NoNetwork
    case TZErrorViewType_NoData
    case TZErrorViewType_ParseError
}

class TZErrorView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    var errorType:TZErrorViewType!
    
    convenience init(type:TZErrorViewType){
        self.init()
//        let error = (Bundle.main.loadNibNamed("TZErrorView", owner: nil, options: nil))?.last as! TZErrorView
//        error.errorType = type
        self.errorType = type
    }
    
    func setTitleandimageUrl(title:String , imageUrl:String){
        self.titleLabel.text = title
        self.imageView.setImageWith(URL(string:imageUrl)!)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
