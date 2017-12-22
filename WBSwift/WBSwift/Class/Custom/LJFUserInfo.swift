//
//  LJFUserInfo.swift
//  WBSwift
//
//  Created by ljf on 2017/12/14.
//  Copyright © 2017年 LJF. All rights reserved.
//  用户信息

import UIKit

class LJFUserInfo: NSObject , NSCoding{

    //重写 description oc是重写description方法 swift 是重写description属性
    override var description: String {
        
    return "description"
    }
    
    //名字
    public   var name : String = String()
    //帐号
    public   var id : String = String()
    //受权code
    public   var code : String = String()
    // 是否登录
    public  var isLogin : Bool = false
    
    
    //受权相关
    //access_token
    public   var access_token : String = String()
    //access_token的生命周期，单位是秒数。
    public  var expires_in : TimeInterval = TimeInterval()
    //授权用户的UID，
    public  var uid : Double = Double()

    
    
    
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
        
        access_token = String()
        expires_in = TimeInterval()
        uid = Double()
    }
    
    
    //归档
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name)
        aCoder.encode(id)
        aCoder.encode(code)
        aCoder.encode(isLogin, forKey: "isLogin")
        
        aCoder.encode(access_token)
        aCoder.encode(expires_in)
        aCoder.encode(uid)
        
    }
    
    //解档  会覆盖构造函数
    required init?(coder aDecoder: NSCoder) {

        //姓名
        if let name = aDecoder.decodeObject() {
            self.name = name as! String
        }else{
            self.name = String()
        }
        //用户id
        if let id = aDecoder.decodeObject() {
            self.id = id as! String
        }else{
            self.id = String()
        }
        //受权code
        if let code = aDecoder.decodeObject() {
            self.code = code as! String
        }else{
            self.code = String()
        } //受权令牌
        if let isLogin = aDecoder.decodeObject() {
            self.isLogin = isLogin as! Bool
        }else{
            self.isLogin = Bool()
        }
        //受权令牌
        if let access_token = aDecoder.decodeObject() {
            self.access_token = access_token as! String
        }else{
            self.access_token = String()
        }
        
        //有效时间
        if let expires_in = aDecoder.decodeObject() {
            self.expires_in = expires_in as! TimeInterval
        }else{
            self.expires_in = TimeInterval()
        }
        
        //uid
        if let uid = aDecoder.decodeObject() {
            self.uid = uid as! Double
        }else{
            self.uid = Double()
        }
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

