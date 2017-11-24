//
//  ViewController.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/21.
//  Copyright © 2017年 zcm. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import SDWebImage
import SwiftyJSON


class ListVC: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var clickInt = 0
    var isTech = true
    
    var data = ["PHP","Java","Ruby","Go","Python","ObjectiveC","Swift","C#","C++","C","HTML","JavaScript"]
    var catData = [ListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demos"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "查看", style: .plain, target: self, action: #selector(choose))
        
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.white;
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        self.getList()
    }
    
    @objc func choose() {
        clickInt = 0
    }
    
    
    func getList() {
        
       MBProgressHUD.showAdded(to: view, animated: true)
        Alamofire.request("https://api.avgle.com/v1/categories", method: .get).responseJSON {
            [weak self] response in
            guard let json = response.result.value else { return }
            guard let this = self else { return }
            this.isTech = false
            MBProgressHUD.hide(for: this.view, animated: true)
            let result = JSON(json)
            let resp = result["response"].dictionaryValue
            this.catData = resp["categories"]!.arrayValue.map({ js in
                ListModel(json: js)
            });
            this.collectionView.reloadData()
        }
    
    }
}

extension ListVC : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell;
        if isTech {
            cell.label.text = data[indexPath.row]
        }else{
            cell.label.text = catData[indexPath.row].name
        }

        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isTech ? data.count : catData.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = floor((view.frame.size.width - 2) / 3)
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.isTech{
            if clickInt == 4{
                self.getList()
                return
            }
            if self.data[indexPath.row] == "Swift" && clickInt < 4{
                clickInt += 1
            }else if self.data[indexPath.row] == "ObjectiveC" && clickInt == 3{
                clickInt += 1
            }else{
                clickInt -= 1
            }
        }else{
            let vc = VideoListVC()
            vc.category = self.catData[indexPath.row].CHID
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


