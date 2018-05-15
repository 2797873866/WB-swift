//
//  WeleComeVC.swift
//  WBSwift
//
//  Created by ljf on 2018/5/15.
//  Copyright © 2018年 LJF. All rights reserved.
//

import UIKit

class WeleComeVC: UIViewController {
    /// 头像
    @IBOutlet weak var userIconIMG: UIImageView!
    /// 名称
    @IBOutlet weak var userNameLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userIMGUrl = LJFUserInfo.sheard.avatar_large;
//        userIconIMG.image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
