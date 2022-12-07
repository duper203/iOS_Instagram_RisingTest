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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        let DMNibOne = UINib(nibName: "FollowRecommendTableViewCell", bundle: nil)
        tableView.register(DMNibOne, forCellReuseIdentifier: "FollowRecommendTableViewCell")
    }
    
    
}
extension FollowRecommendViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowRecommendTableViewCell", for: indexPath) as? FollowRecommendTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    
}
