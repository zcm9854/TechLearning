//
//  VideoListVC.swift
//  TechLearning
//
//  Created by 钟楚萌 on 2017/11/24.
//  Copyright © 2017年 zcm. All rights reserved.
//

import UIKit

import Alamofire
import MBProgressHUD
import SwiftyJSON
import SDWebImage

class VideoListVC: UIViewController {
    var category = ""
    let tableView = UITableView(frame: .zero, style: .grouped)
    var page = 1
    
    var data = [VideoListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ViedeoListCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        self.getList()
        // Do any additional setup after loading the view.
    }
    
    func getList() {
        MBProgressHUD.showAdded(to: view, animated: true)
        Alamofire.request("https://api.avgle.com/v1/videos/\(self.page)?c=\(self.category)", method: .get).responseJSON {
            [weak self] response in
            guard let json = response.result.value else { return }
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            let result = JSON(json)
            let resp = result["response"].dictionaryValue
            this.data = resp["videos"]!.arrayValue.map({ js in
                VideoListModel(json: js)
            });
            this.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension VideoListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViedeoListCell
        cell.titleLabel.text = data[indexPath.row].title
        cell.backIMG.sd_setImage(with: URL(string: data[indexPath.row].previewUrl), completed: nil)
        return cell
    }
}
