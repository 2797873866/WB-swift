//
//  LJFPopObjc.swift
//  WBSwift
//
//  Created by ljf on 2017/12/11.
//  Copyright © 2017年 LJF. All rights reserved.
//

import UIKit

class LJFPopObjc: NSObject {
    lazy var isPresened = false
   
    //定义闭包属性
    var callBack :((_ presened :Bool)->())?
    
    //// 注意:如果自定义了一个构造函数,但是没有对默认构造函数init()进行重写,那么自定义的构造函数会覆盖默认的init()构造函数
   convenience init(callBack:@escaping (_ presened :Bool)->()) {
    self.init()
       self.callBack = callBack
    }
}
extension LJFPopObjc:UIViewControllerTransitioningDelegate {
    
    //代理方法 ==> 自定义弹出控制器
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return LJFPresentationVC(presentedViewController: presented, presenting: presenting)
    }
    //代理方法 ==> 自定义弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresened = true
        self.callBack!(isPresened)
        return self
    }
    //代理方法 ==> 自定义消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresened = false
        self.callBack!(isPresened)
        return self
    }
}



extension LJFPopObjc :UIViewControllerAnimatedTransitioning{
    
    //协议方法
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    //协议方法 == >执行自定义动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresened ? animateionForPresented(context: transitionContext):animateionForDismissView(context: transitionContext)
    }
    
    //自定义presenedView
    func animateionForPresented(context:UIViewControllerContextTransitioning) {
        //获取将要消失的view
        let presentedView = context.view(forKey: UITransitionContextViewKey.to)
        context.containerView.addSubview(presentedView!)
        
        presentedView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        //先把比例Y值调到最小
        presentedView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: context), animations: {
            //在这里复原
            presentedView?.transform = CGAffineTransform.identity
        }) { (_) in
            //完成时调一下上下文
            context.completeTransition(true)
        }
    }
    
    //自定义dismissView动画
    func animateionForDismissView(context:UIViewControllerContextTransitioning) {
        //获取将要消失的view
        let dismissView = context.view(forKey: UITransitionContextViewKey.from)
        context.containerView.addSubview(dismissView!)
        
        dismissView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: context), animations: {
            //在这里变小
            dismissView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)
        }) { (_) in
            //完成时调一下上下文
            dismissView?.removeFromSuperview()
            context.completeTransition(true)
        }
    }
}
