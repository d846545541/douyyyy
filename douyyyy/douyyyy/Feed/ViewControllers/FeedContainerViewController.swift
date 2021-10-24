//
//  FeedContainerViewController.swift
//  douyyyy
//
//  Created by S.sea on 2021/10/24.
//

import UIKit
import SnapKit
import Kingfisher
import SwiftUI

protocol FeedContainerViewControllerDelegate:NSObjectProtocol{
    func feedContainerViewController(controller:FeedContainerViewController,viewControllerAtindexPath:IndexPath)-> UIViewController
    func numberOfViewControllers(in containerViewController:FeedContainerViewController)-> Int
}

class FeedContainerViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    public weak var delegate:FeedContainerViewControllerDelegate?
    
    private var collectionView:UICollectionView!
    private var collectionViewLayout:UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

       // collection view layout
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        
     // collection view
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FeedContainerViewController.self, forCellWithReuseIdentifier: FeedContainerCollectionViewCell.reuseldentifierString)
        
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.edges.equalTo(0)
        }
        
    }
    //MAKE: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath)-> CGSize{
        return collectionView.frame.size
    }
    
    
    
    //MAKE:UIcollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfViewControllers(in: self)??0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedContainerCollectionViewCell.reuseldentifierString, for: indexPath) as!
        FeedContainerCollectionViewCell
        if let viewController = delegate?.feedContainerViewController(controller: self, viewControllerAtindexPath: indexPath){
            cell,Config(with:viewController)
        }
        cell.backgroundColor = UIColor.randomColor
        return cell
    }
 
 }
