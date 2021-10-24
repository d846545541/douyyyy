//
//  FeedRootViewController.swift
//  douyyyy
//
//  Created by S.sea on 2021/10/24.
//

import UIKit

class FeedRootViewController: UIViewController {
    
    private var containerVC:FeedContainerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

     // container VC
        containerVC = FeedContainerViewController()
        containerVC.delegate = self
        addChild(childViewController: containerVC) { subview in
            subview.snp.makeConstraints { make in
                make.leading.trailing.top.equalTo(self.view)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin)
            }
        }
        
    }
    
    
    // MAKE: FeedContainerViewControllerDelegate
    func feedContainerViewController(controller:FeedContainerViewController,viewControllerAtindexPath:IndexPath)-> UIViewController{
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.randomColor
        return vc
    }

  
}
