//
//  TZToast.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/17.
//

import UIKit
import Masonry

class TZToast: UIView {
    var orientationConstraint:MASConstraint!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(hex:0x888888, alpha:0.7)
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.size.height/2
    }
    
    class func toast(msg: String){
        let toast = TZToast()
        let superView = UIApplication.shared.keyWindow
        superView?.addSubview(toast)
        
        let label = UILabel()
        let attr = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.init(hex:0xFCCA07)]
        
        let attributedString = NSMutableAttributedString(string: msg, attributes: attr)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 5.0
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: msg.count))
        label.attributedText = attributedString
        label.sizeToFit()
        toast.addSubview(label)
        label.mas_remakeConstraints { (maker:MASConstraintMaker?) in
            maker?.edges.equalTo()(toast)?.with()?.insets()(UIEdgeInsets(top: 7, left: 5, bottom: 5, right: 5))
            maker?.height.greaterThanOrEqualTo()(label.intrinsicContentSize.height)
            maker?.width.lessThanOrEqualTo()(UIApplication.shared.keyWindow)?.multipliedBy()(0.3)
        }
        toast.mas_remakeConstraints { (maker:MASConstraintMaker?) in
            maker?.centerX.equalTo()(superView)
            toast.orientationConstraint = maker?.top.equalTo()(superView?.mas_bottom)
        }
        toast.startAnimation()
    }
    
   private func startAnimation() {
        self.superview?.layoutIfNeeded()
        self.orientationConstraint.uninstall()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveLinear, animations: {
        self.mas_updateConstraints({ (maker:MASConstraintMaker?) in
             maker?.bottom.equalTo()(self.superview)?.with()?.offset()(-100)
        })
        }) { (finished:Bool) in
             UIView.animate(withDuration: 0.3, delay: 0.5, options: UIView.AnimationOptions.curveLinear, animations: {
                 self.alpha = 0
            }, completion: { (finished:Bool) in
            self.removeFromSuperview()
            })
        }

    }
    
    
    private func intrinsicContentSize() -> CGSize {
        return CGSize.zero
    }
    
}
