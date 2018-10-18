//
//  TZInputView.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/18.
//

import UIKit
import Masonry
class TZInputView: UIView, UITextViewDelegate {
    
    typealias TZInputCompletionClosures = (String) -> Void
    var titleLabel:UILabel!
    var textView:UITextView!
    fileprivate var completionClosure:TZInputCompletionClosures!
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.alpha = 0
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.2)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelAction))
        self.addGestureRecognizer(tap)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.backgroundColor = .white
        self.addSubview(titleLabel)
        
        textView = UITextView()
        textView.backgroundColor = .white
        textView.returnKeyType = .send
        textView.delegate = self
        
        titleLabel.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.leading.trailing()?.equalTo()(self)
            maker?.height.equalTo()(40)
            maker?.bottom.equalTo()(textView.mas_top)
        }
        textView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.leading.bottom()?.trailing()?.equalTo()(self)
            maker?.height.equalTo()(100)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    class func show(superView:UIView, completion:TZInputCompletionClosures) {
        
    }
    
    @objc func cancelAction() {
     textView.resignFirstResponder()
     self.removeFromSuperview()
    }

    @objc func keyboardWillShow(notification:Notification) {
       let userInfo = notification.userInfo
       let value = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
       let duration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
       let curve = userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
       let height = value?.cgRectValue.size.height
        UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
            self.textView.mas_updateConstraints({ (maker:MASConstraintMaker?) in
                maker?.bottom.equalTo()(self)?.offset()(-height!)
            })
        }) { (finished:Bool) in
        }
    }
    
    @objc func keyboardWillHide(notification:Notification) {
        let userInfo = notification.userInfo
        let duration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
            self.textView.mas_updateConstraints({ (maker:MASConstraintMaker?) in
                maker?.bottom.equalTo()(self)
            self.layoutIfNeeded()
            self.alpha = 1.0
            })
        }) { (finished:Bool) in
            self.removeFromSuperview()
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
