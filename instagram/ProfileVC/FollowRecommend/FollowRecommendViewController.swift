//
//  FollowRecommendViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import UIKit

class FollowRecommendViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    //DataManager
    lazy var dataManager: RecommendDataManager = RecommendDataManager()
    var recommendData: [RecommendResult] = []
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.RecommendItem(vc: self)
        
        //tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        let DMNibOne = UINib(nibName: "FollowRecommendTableViewCell", bundle: nil)
        tableView.register(DMNibOne, forCellReuseIdentifier: "FollowRecommendTableViewCell")
    }
    
    
}
extension FollowRecommendViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowRecommendTableViewCell", for: indexPath) as? FollowRecommendTableViewCell else{
            return UITableViewCell()
        }
        if let urlString = recommendData[indexPath.row].imageUrl{
            print(urlString)
            
            let url = URL(string: urlString)
            cell.profileImageView.kf.setImage(with: url)
        }
        let userIdString = recommendData[indexPath.row].userId!
        cell.userIdLabel.text = ("USER \(userIdString)")
        cell.userNameLabel.text = recommendData[indexPath.row].name!

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    
}
extension FollowRecommendViewController {
    func SuccessRecommend(_ result: RecommendResponse) {
        print("친구 추천 화면 정보 가져오기 성공!\(result.message!)")
        
        print(result.result)
        recommendData = result.result
        tableView.reloadData()
        
    }
    
    func failedToRecommend(message: String) {
        
        print("\(message)")
    }
}
