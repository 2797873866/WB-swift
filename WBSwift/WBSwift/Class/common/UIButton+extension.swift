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
     
        var PtitleH = titleH
        if PtitleH == "" {
            PtitleH = title
        }
        
        var PImage = image
        if PImage == "" {
            PImage = "hhhh"
        }
        
        var PImageH = imageH
        if PImageH == "" {
            PImageH = "hhhh"
        }
        
        var PimageBack = imageBack
        if PimageBack == "" {
            PimageBack = "hhhh"
        }
        
        var PimagebackH = imagebackH
        if PimagebackH == "" {
            PimagebackH = "hhhh"
        }
        
        setTitle(title, for:.normal)
        setTitle(PtitleH, for:.highlighted)
        setBackgroundImage(UIImage(named:PimageBack), for: .normal)
        setBackgroundImage(UIImage(named:PimagebackH), for: .highlighted)
        setImage(UIImage(named:PImage), for: .normal)
        setImage(UIImage(named:PImageH), for: .highlighted)
        addTarget(targer, action: action, for: .touchUpInside)
        sizeToFit()
    }
    
    // 事件监听本质发送消息.但是发送消息是OC的特性
    // 将方法包装成@SEL --> 类中查找方法列表 --> 根据@SEL找到imp指针(函数指针) --> 执行函数
    // 如果swift中将一个函数声明称private,那么该函数不会被添加到方法列表中
    // 如果在private前面加上@objc,那么该方法依然会被添加到方法列表中
    convenience init (title:String,image:String,imageH:String,imageBack:String,imagebackH:String,targer:Any,action:Selector){
        self.init()

        var PImage = image
        if PImage == "" {
            PImage = "hhhh"
        }
        
        var PImageH = imageH
        if PImageH == "" {
            PImageH = "hhhh"
        }
        
        var PimageBack = imageBack
        if PimageBack == "" {
            PimageBack = "hhhh"
        }
        
        var PimagebackH = imagebackH
        if PimagebackH == "" {
            PimagebackH = "hhhh"
        }
        
        setTitle(title, for:.normal)
        setTitle(title, for:.highlighted)
        setImage(UIImage(named:PImage), for: .normal)
        setImage(UIImage(named:PImageH), for: .selected)
        setBackgroundImage(UIImage(named:PimageBack), for: .normal)
        setBackgroundImage(UIImage(named:PimagebackH), for: .selected)
        addTarget(targer, action: action, for: .touchUpInside)
        setTitleColor(UIColor.black, for: .normal)
        setTitleColor(UIColor.black, for: .selected)
        sizeToFit()
    }
    
    convenience init (title:String,image:String,imageBack:String,targer:Any,action:Selector){
        self.init()
        
        var PImage = image
        if PImage == "" {
            PImage = "hhhh"
        }
        
        var PimageBack = imageBack
        if PimageBack == "" {
            PimageBack = "hhhh"
        }
        
        setTitle(title, for:.normal)
        setTitle(title, for:.highlighted)
        setBackgroundImage(UIImage(named:PImage), for: .normal)
        setBackgroundImage(UIImage(named:PImage), for: .highlighted)
        setImage(UIImage(named:PimageBack), for: .normal)
        setImage(UIImage(named:PimageBack), for: .highlighted)
        addTarget(targer, action: action, for: .touchUpInside)
        sizeToFit()
    }
    
    convenience init (image:String,imageBack:String,targer:Any,action:Selector){
        self.init()
        var PImage = image
        
        if PImage == "" {
            PImage = "hhhh"
        }
        
        var PimageBack = imageBack
        if PimageBack == "" {
            PimageBack = "hhhh"
        }
        
        setBackgroundImage(UIImage(named:PImage), for: .normal)
        setBackgroundImage(UIImage(named:PImage + "_highlighted"), for: .highlighted)
        setImage(UIImage(named:PimageBack), for: .normal)
        setImage(UIImage(named:PimageBack  + "_highlighted"), for: .highlighted)
        addTarget(targer, action: action, for: .touchUpInside)
        sizeToFit()
    }

}
