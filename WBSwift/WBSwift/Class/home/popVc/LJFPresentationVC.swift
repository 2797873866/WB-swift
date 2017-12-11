//
//  LJFPopAnimationObjc.swift
//  WBSwift
//
//  Created by ljf on 2017/12/11.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit

class LJFPresentationVC:UIPresentationController {
    
    //modal就是把控制器发view放到containerView里面
    //1 拿到 presentedView(就是modal出来控制器的View) 可以改变他的frame
    //2 containerView 的frame 是充满整个屏幕. 可以做其他的事情
    
    lazy var CoverView : UIView = {
        
        let CoverView :UIView = UIView()
        CoverView.frame = UIScreen.main.bounds
//        CoverView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        CoverView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LJFPresentationVC.tapGesture)))
        return CoverView
    }()
    
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()

        //改变呈现Viwe的frame
        let screenRect = UIScreen.main.bounds
        presentedView?.frame = CGRect(x: (screenRect.width-180)*0.5, y: 55, width: 180, height: 250)
        containerView?.insertSubview(CoverView, at: 0)
    }
    

    @objc func tapGesture() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
