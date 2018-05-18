///
///  LJFUserInfo.swift
///  WBSwift
///
///  Created by ljf on 2017/12/14.
///  Copyright © 2017年 LJF. All rights reserved.
///  用户信息

import UIKit
import YYModel

@objcMembers
class LJFUserInfo: NSObject , NSCoding{
    //// 定义的成员变量
    ///友好显示名称
    public   var name : String?
    ///帐号
    public   var id:Int = 0
    ///受权code
    public   var code : String?
    ///是否登录
    var isLogin :Bool = Bool(){
        didSet{
            if isLogin {
                let notifi: Notification = Notification(name: Notification.Name(rawValue: NotificationLoginSuccess), object: nil, userInfo: ["login":"1"])
                /// 登录成功的通知
                postNotification(notifi: notifi)
            }else{
                let notifi: Notification = Notification(name: Notification.Name(rawValue: NotificationLoginSuccess), object: nil, userInfo: ["login":"0"])
                /// 退出登录的通知
                postNotification(notifi: notifi)
            }
        }
    }

    
    ///受权相关
    public   var access_token : String?
    ///过期时间
    public   var expiresDate : Date?{

        willSet{
            
        }
        
        didSet{
            if (access_token?.count)! > 0{
                if expiresDate?.compare(Date.init()) == ComparisonResult.orderedDescending{
                    isLogin = true
                }else{
                  isLogin = false
                }
            }
        }
    }
    
    ///access_token的生命周期，单位是秒数。
    public   var expires_in : TimeInterval = TimeInterval(){
        didSet  {
            expiresDate = Date(timeIntervalSinceNow: expires_in)
        }
    }
    ///授权用户的UID，
    public   var uid : String?
    ///用户昵称
    public   var screen_name : String?
    ///用户头像地址（中图），50×50像素
    public   var profile_image_url : String?
    ///用户的微博统一URL地址
    public   var profile_url : String?
    ///用户头像
    public   var avatar_large : String?
    

    /// 方法
    ///单例
    static let sheard = { () -> LJFUserInfo in
        
        /// filePath
        let filePath = LJFUserInfo.getFilePath()
        
        ///  获取文件
        guard let userInfo = NSKeyedUnarchiver.unarchiveObject(withFile:filePath) as? LJFUserInfo else {
            let userInfo = LJFUserInfo()
            return userInfo
        }
        return userInfo
    }()
    
    /// init 私有化
    private override init() {
        super.init()
    }
    
    
    ///保存
    class func save() {
       
        let userInfo = LJFUserInfo.sheard
        
        ///3 保存到文件
        let isSave :Bool = NSKeyedArchiver.archiveRootObject(userInfo, toFile: LJFUserInfo.getFilePath())
        
        if isSave == true{
            print("归档成功")
        }else{
            print("归档失败")
        }
    }
    
    
    ///清空
    func clear() {
        name = String()
        id = Int()
        code = String()
        isLogin = false
        
        access_token = String()
        expires_in = TimeInterval()
        uid = String()
        LJFUserInfo.save()
    }

    
    ///归档
   @objc func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(id, forKey:"id")
        aCoder.encode(code, forKey: "code")
        aCoder.encode(isLogin, forKey: "isLogin")
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expiresDate, forKey: "expiresDate")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(screen_name, forKey: "screen_name")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        aCoder.encode(profile_image_url, forKey: "profile_image_url")
    }
    
    ///解档  会覆盖构造函数
    required init?(coder aDecoder: NSCoder) {
        ///姓名
        name = aDecoder.decodeObject(forKey: "name") as! String?
        ///用户id
//        id = aDecoder.decodeObject(forKey:"id")as?Int
        id = aDecoder.decodeInteger(forKey: "id")
        ///受权code
        code = aDecoder.decodeObject(forKey: "code") as! String?
        ///受权令牌
        isLogin = aDecoder.decodeBool(forKey: "isLogin")
        ///受权令牌
        access_token = aDecoder.decodeObject(forKey: "access_token") as! String?
        ///有效时间
        expiresDate = aDecoder.decodeObject(forKey: "expiresDate") as! Date?
        ///uid
        uid = aDecoder.decodeObject(forKey: "uid") as! String?
        ///呢称
        screen_name = aDecoder.decodeObject(forKey: "screen_name") as! String?
        /// 头像地址
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as! String?
        ///
        profile_image_url = aDecoder.decodeObject(forKey: "profile_image_url") as! String?
    }
    

    
    /// 字典转模型对象
    class func userInfoWithDict(dict:[String :Any]) {
        /// 字典转模型
        LJFUserInfo.sheard.setValuesForKeys(dict)
        /// 保存沙盒
        LJFUserInfo.save()
    };
    
    /// 重写undefinedKey防止崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(key);
    }
    
    ///获取文件路径
    class func getFilePath() -> String {
        ///1 获取文件路径
        let path :String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        ///2 拼接文件名
        let filePath : String = path + "/" + "userInfo.plist"
        
        return filePath
    }
    
    ///  逆时发通知
    func postNotification(notifi:Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
          NotificationCenter.default.post(notifi)
        }
    }

    ///重写 description oc是重写description方法 swift 是重写description属性
    override var description: String {
        return dictionaryWithValues(forKeys: ["name","code","access_token","expires_in"]).description
    }
    
}

