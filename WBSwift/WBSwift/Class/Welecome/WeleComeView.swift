//
//  WeleComeVC.swift
//  WBSwift
//
//  Created by ljf on 2018/5/15.
//  Copyright © 2018年 LJF. All rights reserved.
//

import UIKit
import SDWebImage

class WeleComeView: UIView {
    /// 头像
    @IBOutlet weak var userIconIMG: UIImageView!
    /// 名称
    @IBOutlet weak var userNameLB: UILabel!
    
    var wcWindow: UIWindow? = {
        let window = UIWindow()
        window.frame = UIScreen.main.bounds
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()
        return window
    }()

    class func createView(){
        guard let welecomeV = Bundle.main.loadNibNamed("WeleComeView", owner: nil, options: nil)?.last as? WeleComeView else {
            return
        }
        welecomeV.frame = UIScreen.main.bounds
        welecomeV.wcWindow?.addSubview(welecomeV)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
   
        guard let userIMGUrl = LJFUserInfo.sheard.avatar_large else {
            return;
        }
        /// 用户头象
        let url = URL(string: userIMGUrl)
        userIconIMG.sd_setImage(with: url, placeholderImage: nil, options: .allowInvalidSSLCertificates, completed: nil)

        /// 用户名称
        guard let userName = LJFUserInfo.sheard.name  else {
            return
        }
        userNameLB.text = userName
        
        removeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func removeView()  {
        weak var WeakSelf = self
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            WeakSelf?.removeFromSuperview()
            WeakSelf?.wcWindow = nil
        }

    }

  
    
}
