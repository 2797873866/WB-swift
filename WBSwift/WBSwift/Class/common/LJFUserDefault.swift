//
//  LJFUserDefault.swift
//  WBSwift
//
//  Created by ljf on 2017/12/10.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit

class LJFUserDefault: NSObject {

     var userName: String = ""

     var userID: String = ""

     var userNumber: String = ""

     var userLoing: Bool = false
    
    static let userDefault : LJFUserDefault = {
        let userDefault :LJFUserDefault = LJFUserDefault()
        
        return userDefault
    }()
}
