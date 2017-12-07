

import UIKit

class HomeViewController: BaseViewController {
    // MARK:- 属性
    
    // MARK:- 懒加载属性
    private lazy var titleBtn : TitleButton = TitleButton()
    // 注意:在闭包中如果使用当前对象的属性或者调用方法,也需要加self
    // 两个地方需要使用self : 1> 如果在一个函数中出现歧义 2> 在闭包中使用当前对象的属性和方法也需要加self
    private lazy var popoverAnimator : PopoverAnimator = PopoverAnimator {[weak self] (presented) -> () in
        self?.titleBtn.selected = presented
    }
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.没有登录时设置的内容
        visitorView.addRotationAnim()
        if !isLogin {
            return
        }
        
        // 2.设置导航栏的内容
        setupNavigationBar()
    }
}


// MARK:- 设置UI界面
extension HomeViewController {
    private func setupNavigationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        
        // 2.设置右侧的Item
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // 3.设置titleView
        titleBtn.setTitle("coderwhy", forState: .Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
}


// MARK:- 事件监听的函数
extension HomeViewController {
    @objc private func titleBtnClick(titleBtn : TitleButton) {
        // 1.创建弹出的控制器
        let popoverVc = PopoverViewController()
        
        // 2.设置控制器的modal样式
        popoverVc.modalPresentationStyle = .Custom
        
        // 3.设置转场的代理
        popoverVc.transitioningDelegate = popoverAnimator
        popoverAnimator.presentedFrame = CGRect(x: 100, y: 100, width: 180, height: 250)
        
        // 4.弹出控制器
        presentViewController(popoverVc, animated: true, completion: nil)
    }
}










