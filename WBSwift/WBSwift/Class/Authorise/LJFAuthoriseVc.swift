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
    }

    func addChild() {
        view.addSubview(webView)
        
        
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
}

extension LJFAuthoriseVc: WKUIDelegate{
    
    
    
    
}
