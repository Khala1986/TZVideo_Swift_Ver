//
//  TZErrorView.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/15.
//

import UIKit

enum TZErrorViewType: UInt {
    case TZErrorViewType_Unknown
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
        let error = (Bundle.main.loadNibNamed("TZErrorView", owner: nil, options: nil))?.last as! TZErrorView
        error.errorType = type
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
