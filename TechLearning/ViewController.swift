//
//  ViewController.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/21.
//  Copyright © 2017年 zcm. All rights reserved.
//

import UIKit
import IGListKit
import Alamofire


class ViewController: UIViewController,ListAdapterDataSource {
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var data = ["PHP","Java","Ruby","Go","Python","ObjectiveC","Swift","C#","C++","C","HTML","JavaScript"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demos"
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        collectionView.backgroundColor = UIColor.white;
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DemoSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }


}

