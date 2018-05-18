//
//  LJFNetTools.swift
//  WBSwift
//
//  Created by ljf on 2017/12/11.
//  Copyright © 2017年 LJF. All rights reserved.
//
enum requestType:String {
    case GET = "GET"
    case POST = "POST"
    case POSTFile = "POSTFile"
}

import UIKit
import AFNetworking

 final class LJFNetTools: NSObject {

    //提供一个静态变量
     static var shard = { () -> LJFNetTools in
        let  shard = LJFNetTools()
        return shard
    }()
    //init 私有化
    private override init() {}
    
    
    //私有的管理属性
    private let manager = { () -> AFHTTPSessionManager in
    let manager =  AFHTTPSessionManager()
        manager.responseSerializer.acceptableContentTypes?.insert("text/html")
        manager.responseSerializer = AFJSONResponseSerializer.init()
        return manager
    }()
    
    //类方法 get 请求
    class func get(url:String,parm:[String:Any],_ result:@escaping (AnyObject?) ->(),_ error:@escaping (AnyObject?) -> ()) {
        shard.request(typ: requestType.GET, url: url, parm: parm, result: result , error: error)
    }

    //类方法 post 请求
    class func post(url:String,parm:[String:Any],_ result:@escaping (AnyObject?) ->(),_ error:@escaping (AnyObject?) -> ()) {
        shard.request(typ: requestType.POST, url: url, parm: parm, result: result , error: error)
    }
    
    class func postFile(url:String,_ result: @escaping (AnyObject?) ->(),_ error:@escaping (AnyObject?) -> ()) {
        shard.request(typ: requestType.POSTFile, url: url, parm: nil, result: result , error: error)
    }
    
    //共用请求方法
 
   private func request(typ:requestType, url:String,parm:[String:Any]?, result:@escaping (AnyObject?) ->(), error:@escaping (AnyObject?) -> ()) {
        
        if typ == requestType.GET {
            if parm == nil{
                return
            }

            //get 方法
            manager.get(url, parameters: parm!, progress: { (progre) in
                
            }, success: { (task, Resutl) in
                LJFNetTools.dispatchAction(result: result, param: Resutl as AnyObject)
            }) { (task, Error) in
                LJFNetTools.dispatchAction(result: error, param: Error as AnyObject)
            }
            
        } else if typ == requestType.POST{
            
            if parm == nil{
                return
            }
            //post 方法
            manager.post(url, parameters: parm!, progress: { (progre) in
                
            }, success: { (task, tempResult) in
                
                if tempResult != nil{
                    LJFNetTools.dispatchAction(result: result, param: tempResult as AnyObject)
                }
            }) { (task, tempError) in
                    LJFNetTools.dispatchAction(result: error, param: tempError as AnyObject)
            }
            
            
        }else{
            //postFile方法
            let request = URLRequest(url: URL.init(string: url)!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 300.0)
            let data = Data.init()
            
            manager.uploadTask(with: request, from: data, progress: { (progre) in
                //输出进度
                
            }) { (response, tempresult, temperror) in
                //回调
                if tempresult != nil{
                    LJFNetTools.dispatchAction(result: result, param: tempresult as AnyObject)
                }else{
                    LJFNetTools.dispatchAction(result: error, param: temperror as AnyObject)
                }
            }
        }
    }
    
    class func dispatchAction(result:@escaping (AnyObject?) ->(),param:AnyObject?) {
        DispatchQueue.main.async {
            result(param)
        }
    }
}







