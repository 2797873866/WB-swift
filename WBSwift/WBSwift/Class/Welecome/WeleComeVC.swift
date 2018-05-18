//
//  WeleComeVC.swift
//  WBSwift
//
//  Created by ljf on 2018/5/15.
//  Copyright © 2018年 LJF. All rights reserved.
//

import UIKit
import SDWebImage

class WeleComeVC: UIViewController {
    /// 头像
    @IBOutlet weak var userIconIMG: UIImageView!
    /// 名称
    @IBOutlet weak var userNameLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let userIMGUrl = LJFUserInfo.sheard.avatar_large else {
//            return;
//        }
//        /// 用户头象
//        let url = URL(string: userIMGUrl)
//        userIconIMG.sd_setImage(with: url, placeholderImage: nil, options: .allowInvalidSSLCertificates, completed: nil)
//        
//        /// 用户名称
//        guard let userName = LJFUserInfo.sheard.name  else {
//            return
//        }
//        userNameLB.text = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
