//
//  TableViewController.swift
//  WBSwift
//
//  Created by ljf on 2017/12/7.
//  Copyright © 2017年 LJF. All rights reserved.
//
import UIKit

class LJFHomeVc: LJFBaseVc {
    
    lazy var titleBtn : LJFButton = {
        
        let titleBtn = LJFButton(title: "hehehe", image:"navigationbar_arrow_down", imageH: "navigationbar_arrow_up", imageBack: "", imagebackH: "", targer: self, action: #selector(LJFHomeVc.titleAction))
        titleBtn.titelPoint = ButtonTitlePoint.Left
        return titleBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild()
    }

    func addChild() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIButton(image: "navigationbar_pop", imageBack: "", targer:self, action: #selector((LJFHomeVc.leftAction))))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIButton(image: "navigationbar_friendattention", imageBack: "", targer:self, action: #selector((LJFHomeVc.rightAction))))
        
        navigationItem.titleView = titleBtn

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LJFHomeVc {
   
    //左边
    @objc func leftAction ()  {
        
    }
    
    //右边
    @objc func rightAction ()  {
        
    }
    
    //中间
    @objc func titleAction ()  {
        
    }
    
}



