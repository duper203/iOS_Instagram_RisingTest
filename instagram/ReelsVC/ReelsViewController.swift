//
//  ReelsViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit
import SnapKit

class ReelsViewController: UIViewController{
    
    //DataManager
    lazy var dataManager:  ReelsDataManager = ReelsDataManager()
    
    var ReelsData: [ReelsResult] = []
    
    @IBOutlet weak var reelsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //GET
        
        dataManager.ReelsItem(vc: self)
        
        //tableview setup
        reelsTableView.delegate = self
        reelsTableView.dataSource = self

        let reelsNib = UINib(nibName: "ReelsTableViewCell", bundle: nil)
        reelsTableView.register(reelsNib, forCellReuseIdentifier: "ReelsTableViewCell")
    }
    
}
extension ReelsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReelsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReelsTableViewCell", for: indexPath) as? ReelsTableViewCell else{
            return UITableViewCell()
        }
        if let urlString =
            
            //ReelsData.url : 릴스영상 url
            ReelsData[indexPath.row].url{
            print(urlString)
            
            
//            cell.setupURL(urlString)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 710
    }
}
extension ReelsViewController {
    func SuccessReels(_ result: ReelsResponse) {
        print("릴스 화면 정보 가져오기 성공!\(result.message!)")
        
        print(result.result)

        ReelsData = result.result
        reelsTableView.reloadData()
        print(ReelsData.count)
        
    }
    
    func failedToReels(message: String) {
        
        print("\(message)")

    }
}
