//
//  TableViewController.swift
//  WBSwift
//
//  Created by ljf on 2017/12/8.
//  Copyright © 2017年 LJF. All rights reserved.
//
import UIKit

extension UIButton{
    
    // convenience : 便利,使用convenience修饰的构造函数叫做便利构造函数
    // 遍历构造函数通常用在对系统的类进行构造函数的扩充时使用
    /*
     遍历构造函数的特点
     1.遍历构造函数通常都是写在extension里面
     2.遍历构造函数init前面需要加载convenience
     3.在遍历构造函数中需要明确的调用self.init()
     */
    convenience init (title:String,titleH:String,image:String,imageH:String,imageBack:String,imagebackH:String,targer:Any,action:Selector){
        self.init()
    
        setTitle(title, for:.normal)
        setTitle(titleH, for:.highlighted)
        setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: .highlighted)
        setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .highlighted)
        addTarget(targer, action: action, for: .touchUpInside)
        sizeToFit()
    }
    
    convenience init (title:String,image:String,imageH:String,imageBack:String,imagebackH:String,targer:Any,action:Selector){
        self.init()
        
        setTitle(title, for:.normal)
        setTitle(title, for:.highlighted)
        setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: .highlighted)
        setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .highlighted)
        addTarget(targer, action: action, for: .touchUpInside)
        sizeToFit()
    }
    
    convenience init (title:String,image:String,imageBack:String,targer:Any,action:Selector){
        self.init()
        
        setTitle(title, for:.normal)
        setTitle(title, for:.highlighted)
        setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .highlighted)
        setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        setImage(UIImage(named:"tabbar_compose_icon_add"), for: .highlighted)
        addTarget(targer, action: action, for: .touchUpInside)
        sizeToFit()
    }
}
