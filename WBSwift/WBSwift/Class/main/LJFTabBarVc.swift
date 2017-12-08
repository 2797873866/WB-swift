//
//  LJFTabBarVc.swift
//  WBSwift
//
//  Created by ljf on 2017/12/7.
//  Copyright © 2017年 LJF. All rights reserved.
//
import UIKit

class LJFTabBarVc: UITabBarController {
    
    lazy var addBtn : UIButton = {
        let  tempBtn = UIButton()
        tempBtn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        tempBtn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: .highlighted)
        tempBtn.setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        tempBtn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .highlighted)
        tempBtn.sizeToFit()
        
        return tempBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加子控制器
        addChild()
        tabBar.tintColor = UIColor.orange
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tabBar.bringSubview(toFront: addBtn)
        addBtn.center = CGPoint(x: tabBar.center.x,y: tabBar.bounds.size.height * 0.5)
        
    }
    

    func addChild(){
        creatVC(VcName: "LJFHomeVc", title: "首页", image: "tabbar_home", imageH: "tabbar_home_highlighted")
        creatVC(VcName: "LJFMessageVc", title: "消息", image: "tabbar_message_center", imageH: "tabbar_message_center_highlighted")
        creatVC(VcName: "LJFAddVc", title: "", image: "", imageH: "")
        creatVC(VcName: "LJFDiscoverVc", title: "发现", image: "tabbar_discover", imageH: "tabbar_discover_highlighted")
        creatVC(VcName: "LJFMeVc", title: "我的", image: "tabbar_profile", imageH: "tabbar_profile_highlighted")
        
        tabBar.addSubview(addBtn)
        tabBar.bringSubview(toFront: addBtn)

    }
    

    //创建子控制器
    func creatVC(VcName:String,title:String,image:String,imageH:String)  {
       
        // 0.获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {

            return
        }
        
        // 2 根据字符串创建对应的类
        guard let VcClass = NSClassFromString(nameSpace + "." + VcName) else {
            
            return
        }
        
        // 4 获取对应类型
        guard let VcType = VcClass as? UIViewController.Type else {
            
            return
        }
        
        // 5 创建控制器
        let Vc =  VcType.init()
        
        Vc.title = title
        Vc.tabBarItem.image = UIImage(named: image)
        Vc.tabBarItem.selectedImage = UIImage(named: imageH)
        
        // 6 创建导航控制器
        let NaVc = LJFNaVc(rootViewController: Vc)
        
        // 7 添加为子控制器
        addChildViewController(NaVc)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
