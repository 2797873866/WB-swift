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
        
        VisitorView.addAnimation()
        return VisitorView
    }

  
}

//add action
extension LJFVisitorView{
    
    @IBAction func loginAction(_ sender: UIButton) {
       
        let authorVc = LJFAuthoriseVc()
        authorVc.urlStr = authorRul
        getVC().navigationController?.pushViewController(authorVc, animated: true)
    }
    @IBAction func regesterAction(_ sender: UIButton) {
        
    }
    
    //获取显示的控制器
    func getVC() -> UIViewController {
        
        let Vc = UIApplication.shared.keyWindow!.rootViewController!
        
        if Vc.isKind(of: LJFTabBarVc.self){
            let Vc = Vc as! LJFTabBarVc
            let naVc = Vc.selectedViewController as! LJFNaVc
            return naVc.visibleViewController!
        }else{
            let naVc = Vc as! LJFNaVc
            return naVc.presentingViewController!
        }
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
