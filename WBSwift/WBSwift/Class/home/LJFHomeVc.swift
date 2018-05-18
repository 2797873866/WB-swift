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
    
    lazy var popObjc = LJFPopObjc { [weak self] (isPresened : Bool) in
        self!.titleBtn.isSelected = isPresened
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild()
        loadData()
    }

    
    func addChild() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIButton(image: "navigationbar_pop", imageBack: "", targer:self, action: #selector((LJFHomeVc.leftAction))))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIButton(image: "navigationbar_friendattention", imageBack: "", targer:self, action: #selector((LJFHomeVc.rightAction))))
        
        navigationItem.titleView = titleBtn

    }
    
    func loadData()  {
//        let userInfo = LJFUserInfo.sheard
//        let access_token = LJFUserInfo.sheard.access_token!
//        let param:[String:Any] = ["access_token":access_token,]
//        LJFNetTools.get(url: homeUrl, parm: param, { objc in
//            print(objc)
//        }) { (error) in
//            print(error)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let userInfo = LJFUserInfo.sheard
        LJFUserInfo.save()

        print (userInfo);
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
        
        // 1.创建弹出的控制器
        let popVc = LJFPopVC()
        // 2.设置控制器的modal样式
        popVc.modalPresentationStyle = .custom
        // 3.设置转场的代理
        popVc.transitioningDelegate = popObjc;
        //4 弹出控制器
        present(popVc, animated: true, completion: nil)
    }
}



