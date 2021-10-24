//
//  UIViewController+DouYin.swift
//  douyyyy
//
//  Created by S.sea on 2021/10/24.
//

import Foundation
import UIKit


extension UIViewController{
    
    func addChild(childViewController:UIViewController?,layout:(_ view:UIView)->Void) {
        guard let childViewController = childViewController else {
            return
        }
        
        view.addSubview(childViewController.view)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
        
        layout(childViewController.view)
    }
}
