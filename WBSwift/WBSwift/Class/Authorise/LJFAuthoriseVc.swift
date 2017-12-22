//
//  LJFAuthoriseVc.swift
//  WBSwift
//
//  Created by ljf on 2017/12/12.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit
import WebKit

class LJFAuthoriseVc: UIViewController {
    
   private var _urlStr:String = "https://www.baidu.com"
           var urlStr: String {
                
            set {
                self._urlStr = newValue
            }
            get {
                return self._urlStr
            }
        }

    
   lazy var webView:WKWebView = {
        let webView = WKWebView()
        webView.frame = UIScreen.main.bounds
    
        webView.navigationDelegate = self
        webView.uiDelegate = self
    
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild()

        loadUrl()
       
    }

    func addChild() {
        view.addSubview(webView)
        
    }
    
    func loadUrl()  {
        let tempUrl = self.urlStr+"?client_id=\(appKey)&redirect_uri=\(returnUrl)"
        let urlStr = tempUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: urlStr!)!
        let urlRequest = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadRevalidatingCacheData, timeoutInterval: 30)
        webView.load(urlRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

extension LJFAuthoriseVc: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         webView.evaluateJavaScript("document.title", completionHandler: { [weak self](result, error) in
            self?.title = result as? String
        })
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
       
        // 1.获取加载网页的NSURL
        guard webView.url != nil else {
            return
        }
        
        // 2.获取url中的字符串
        let urlStr = webView.url!.absoluteString
        
        // 3.判断该字符串中是否包含code
        guard (urlStr as NSString).components(separatedBy: "code=").count>0 else {
            return
        }
       
        // 4.将code截取出来
        let code = urlStr.components(separatedBy: "code=").last!
        
        print(code)
        
        //保存用户 受权 code
        UserDefaults.standard.set(code, forKey: "code")
        LJFUserInfo.sheard.code = code
        LJFUserInfo.save()
        
        //获取authToKen
        getAuthToken(authCode: code)
        
        webView.stopLoading()
        self.navigationController?.popViewController(animated: true)
    }
    
    //获取受权accessToken
    func getAuthToken(authCode:String) {
        let pram = ["client_id":appKey,"client_secret":appSecret,"grant_type":"authorization_code","code":authCode,"redirect_uri":"https://test.com"]
        
        LJFNetTools.post(url: URLAccessToKen, parm: pram, { (resutl) in
            if resutl == nil {
                return
            }
            
            if let dict : NSDictionary = resutl as? NSDictionary {
                
                LJFUserInfo.sheard.access_token = dict.object(forKey: "access_token") as! String
                LJFUserInfo.save()
            }
        }) { (error) in
            print(error ?? "error")
        }
        
    }
}




extension LJFAuthoriseVc: WKUIDelegate{

    
}
