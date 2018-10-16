//
//  TZLoading.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/16.
//

import UIKit

class TZLoading: UIView {

    @IBInspectable var lineWidth:CGFloat = 1.0
    @IBInspectable var lineColor:UIColor = .clear
    fileprivate var lineLayer:CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        self.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30))
        lineColor = UIColor(hex: 0xFCCA07)
        lineWidth = 2
        let radius = min(self.frame.size.width, self.frame.size.height)/2 - lineWidth
        let linePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: radius, startAngle: degTorad(-90), endAngle: degTorad(270), clockwise: true)
        linePath.lineWidth = lineWidth
        linePath.lineCapStyle = .round
        linePath.lineJoinStyle = .round
        linePath.stroke()
        
        lineLayer = CAShapeLayer()
        lineLayer.frame = self.bounds
        self.layer.insertSublayer(lineLayer, at: 1)
        
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = lineColor.cgColor
        lineLayer.lineCap = .round
        lineLayer.lineJoin = .round
        lineLayer.lineWidth = lineWidth
        lineLayer.path = linePath.cgPath
    }
    
    func startLoading(){
        self.isHidden = false
        
        let animation = CABasicAnimation(keyPath:"strokeEnd")
        animation.duration = 2;
        animation.fromValue = 0.0
        animation.toValue =  1.0
        animation.toValue = MAXFLOAT
        lineLayer.add(animation, forKey: "strokeEnd")
    }
    
    func stopLoading() {
        self.isHidden = true
        lineLayer.removeAllAnimations()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func degTorad(_ number: Double) -> CGFloat {
        return CGFloat(number * .pi / 180)
    }
}
