//
//  UIButton-Extension.swift
//  DS11WB
//
//  Created by xiaomage on 16/4/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

extension UIButton {
    // convenience : 便利,使用convenience修饰的构造函数叫做便利构造函数
    // 遍历构造函数通常用在对系统的类进行构造函数的扩充时使用
    /* 
     遍历构造函数的特点
        1.遍历构造函数通常都是写在extension里面
        2.遍历构造函数init前面需要加载convenience
        3.在遍历构造函数中需要明确的调用self.init()
     */
    convenience init (imageName : String, bgImageName : String) {
        self.init()
        
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), forState: .Highlighted)
        sizeToFit()
    }
}