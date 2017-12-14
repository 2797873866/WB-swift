//
//  LJFUserInfo.swift
//  WBSwift
//
//  Created by ljf on 2017/12/14.
//  Copyright © 2017年 LJF. All rights reserved.
//  用户信息

import UIKit

class LJFUserInfo: NSObject , NSCoding{

    
    //名字
 public   var name : String = String()
    //帐号
 public   var id : String = String()
    //受权code
 public   var code : String = String()
    // 是否登录
 public  var isLogin : Bool = false
    
    
    
    //单例
    static let sheard = { () -> LJFUserInfo in
 
        //  获取文件
        guard let temp = NSKeyedUnarchiver.unarchiveObject(withFile: LJFUserInfo.getFilePath()) as? LJFUserInfo else {
            
            let userInfo = LJFUserInfo()
            
            return userInfo
        }
        return temp
    }()
    
    // init 私有化
    private override init() {
        super.init()
    }
    
    //获取
    
    
    //保存
    class func save() {
       
        let userInfo = LJFUserInfo.sheard
        
        //3 保存到文件
        let isSave :Bool = NSKeyedArchiver.archiveRootObject(userInfo, toFile: LJFUserInfo.getFilePath())
        
        if isSave == true{
            print("归档成功")
        }else{
            print("归档失败")
        }
    }
    
    
    //清空
    func clear() {
        name = String()
        id = String()
        code = String()
        isLogin = false
    }
    
    
    //归档
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name)
        aCoder.encode(id)
        aCoder.encode(code)
        aCoder.encode(isLogin, forKey: "isLogin")
    }
    
    //解档  会覆盖构造函数
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject() as! String
        id = aDecoder.decodeObject() as! String
        code = aDecoder.decodeObject() as! String
        isLogin = aDecoder.decodeBool(forKey: "isLogin")
    }
    
    //获取文件路径
    class func getFilePath() -> String {
        //1 获取文件路径
        let path :String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        //2 拼接文件名
        let filePath : String = path + "/" + "userInfo.data"
        
        return filePath
    }
}

