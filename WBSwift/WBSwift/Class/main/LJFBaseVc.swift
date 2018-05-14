//
//  LJFBaseVc.swift
//  WBSwift
//
//  Created by ljf on 2017/12/7.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit

class LJFBaseVc: UIViewController {

    /// 登录的View
        lazy var VisitorView:LJFVisitorView = {
       
        let VisitorView = LJFVisitorView.VisitorView()
        
        let screenRect = UIScreen.main.bounds
        VisitorView.frame = CGRect(x: 0, y: 0, width: screenRect.width, height: screenRect.height)
            
        return VisitorView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(VisitorView)
        NotificationCenter.default.addObserver(self, selector: #selector((LJFBaseVc.logAction(notifi:))), name: NSNotification.Name(rawValue: NotificationLoginSuccess), object: "1")
        
        NotificationCenter.default.addObserver(self, selector: #selector((LJFBaseVc.logAction(notifi:))), name: NSNotification.Name(rawValue: NotificationLogOut), object: "0")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    @objc func logAction(notifi:Notification)  {
        if let info = notifi.userInfo {
//            if let infoStr = info as String{
            print(info)
//            }
        }
    }
}
