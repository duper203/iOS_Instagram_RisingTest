//
//  ReelsViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit

class ReelsViewController: UIViewController{
    
    
    @IBOutlet weak var reelsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reelsTableView.delegate = self
        reelsTableView.dataSource = self
        
        let reelsNib = UINib(nibName: "ReelsTableViewCell", bundle: nil)
        reelsTableView.register(reelsNib, forCellReuseIdentifier: "ReelsTableViewCell")
        
        
    }
    
}
extension ReelsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReelsTableViewCell", for: indexPath) as? ReelsTableViewCell else{
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 710
    }
    
    
    
}
