//
//  TableViewController.swift
//  WBSwift
//
//  Created by ljf on 2017/12/7.
//  Copyright © 2017年 LJF. All rights reserved.
//
import UIKit

class LJFHomeVc: LJFBaseVc {
    lazy var isPresened = false
    lazy var titleBtn : LJFButton = {
        
        let titleBtn = LJFButton(title: "hehehe", image:"navigationbar_arrow_down", imageH: "navigationbar_arrow_up", imageBack: "", imagebackH: "", targer: self, action: #selector(LJFHomeVc.titleAction))
        titleBtn.titelPoint = ButtonTitlePoint.Left
        return titleBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild()
    }

    func addChild() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIButton(image: "navigationbar_pop", imageBack: "", targer:self, action: #selector((LJFHomeVc.leftAction))))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIButton(image: "navigationbar_friendattention", imageBack: "", targer:self, action: #selector((LJFHomeVc.rightAction))))
        
        navigationItem.titleView = titleBtn

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LJFHomeVc {
   
    //左边
    @objc func leftAction ()  {
        
    }
    
    //右边
    @objc func rightAction ()  {
        
    }
    
    //中间
    @objc func titleAction ()  {
        
        // 1.创建弹出的控制器
        let popVc = LJFPopVC()
        // 2.设置控制器的modal样式
        popVc.modalPresentationStyle = .custom
        // 3.设置转场的代理
        popVc.transitioningDelegate = self;
        //4 弹出控制器
        present(popVc, animated: true, completion: nil)
    }
}

extension LJFHomeVc:UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return LJFPresentationVC(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       isPresened = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresened = false
        return self
    }
}



extension LJFHomeVc :UIViewControllerAnimatedTransitioning{
    
    //协议方法
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    //协议方法
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresened ? animateionForPresented(context: transitionContext):animateionForDismissView(context: transitionContext)
    }
    
    //自定义presenedView
    func animateionForPresented(context:UIViewControllerContextTransitioning) {
        
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
        
        let dismissView = context.view(forKey: UITransitionContextViewKey.from)
        context.containerView.addSubview(dismissView!)
        
        dismissView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: context), animations: {
            //在这里变小
            dismissView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)
        }) { (_) in
            
            //完成时调一下上下文
            context.completeTransition(true)
        }
    }
}

