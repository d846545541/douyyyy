//
//  FeedcontainerCollectionViewCell.swift
//  douyyyy
//
//  Created by S.sea on 2021/10/24.
//

import UIKit

class FeedContainerCollectionViewCell: UICollectionViewCell {
    
    static let reuseldentifierString = "FeedContainerCollectionViewCell"
    
    private var viewController: UIViewController?
    
    public func config(with viewController: UIViewController){
        self.viewController?.view.removeFromSuperview()
        self.viewController = viewController
        
        if let view = self.viewController?.view{
            self.contentView.addSubview(view)
            view.snp.makeConstraints { make in
                make.edges.equalTo(0)
            }
        }
    }
    
}
