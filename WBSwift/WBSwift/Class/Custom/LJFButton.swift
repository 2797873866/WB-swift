//
//  LJFPopButton.swift
//  WBSwift
//
//  Created by ljf on 2017/12/10.
//  Copyright © 2017年 LJF. All rights reserved.
//

enum ButtonTitlePoint{
    case Right
    case Left
    case Top
    case Bottom
}


import UIKit

class LJFButton: UIButton {

   var titelPoint : ButtonTitlePoint = ButtonTitlePoint.Right

    override func layoutSubviews() {
        super.layoutSubviews()

        switch titelPoint {
        case .Right:
            break
            
        case .Left:
            titleLabel?.frame.origin.x = 0
            imageView?.frame.origin.x = (titleLabel?.frame.width)! + 10
            break
            
        case .Top:
            titleLabel?.frame.origin.x = 0
            imageView?.frame.origin.x = 0
            imageView?.frame.origin.y = (titleLabel?.frame.height)! + 5
            break
            
        default:
             imageView?.frame.origin.x = 0
             titleLabel?.frame.origin.x = (titleLabel?.frame.width)! + 10
        }
        
        sizeToFit()
    }
}
