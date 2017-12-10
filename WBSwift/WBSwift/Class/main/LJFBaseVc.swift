//
//  LJFBaseVc.swift
//  WBSwift
//
//  Created by ljf on 2017/12/7.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit

class LJFBaseVc: UIViewController {

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        
    }
    
}
