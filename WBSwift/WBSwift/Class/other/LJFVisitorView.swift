//
//  LJFVisitorView.swift
//  WBSwift
//
//  Created by ljf on 2017/12/8.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit

class LJFVisitorView: UIView {
    //旋转imageView
    @IBOutlet weak var rotationImageView: UIImageView!
    //中间的图标
    @IBOutlet weak var iconImageView: UIImageView!
    //消息Lable
    @IBOutlet weak var infoLable: UILabel!
    //登录
    @IBOutlet weak var loginButton: UIButton!
    //注册
    @IBOutlet weak var rigesterButton: UIButton!
    
    //类方法获取view
    class func VisitorView() -> LJFVisitorView {
        
        let VisitorView = Bundle.main.loadNibNamed("LJFVisitorView", owner: nil, options: nil)!.last as! LJFVisitorView
        
        VisitorView.loginButton.addTarget(self, action: #selector(LJFVisitorView.loginAction), for: UIControlEvents.touchUpInside)
        VisitorView.rigesterButton.addTarget(self, action: #selector(LJFVisitorView.regesterAction), for: UIControlEvents.touchUpInside)
        VisitorView.addAnimation()
        return VisitorView
    }
}

//add action
extension LJFVisitorView{
    @objc func loginAction() {
        
    }
    
    @objc func regesterAction() {
        
    }
}


//add animation
extension LJFVisitorView{
    @objc func addAnimation() {
        let baseAnimation = CABasicAnimation()
        
        baseAnimation.keyPath = "transform.rotation.z"
        baseAnimation.fromValue = 0
        baseAnimation.toValue = 3.1415926 * 2
        baseAnimation.duration = 5
        baseAnimation.repeatCount = MAXFLOAT
        baseAnimation.isRemovedOnCompletion = false
        
        rotationImageView.layer.add(baseAnimation, forKey: "")
    }
}
