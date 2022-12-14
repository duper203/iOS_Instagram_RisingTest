//
//  FollowRecommendViewController.swift
//  instagram
//
//  Created by κΉνμ on 2022/12/08.
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
        navigationController?.isNavigationBarHidden = true

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
        print("μΉκ΅¬ μΆμ² νλ©΄ μ λ³΄ κ°μ Έμ€κΈ° μ±κ³΅!\(result.message!)")
        
        print(result.result)
        recommendData = result.result
        tableView.reloadData()
        
    }
    
    func failedToRecommend(message: String) {
        
        print("\(message)")
    }
}
