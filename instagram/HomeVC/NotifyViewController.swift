//
//  NotifyViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit

class NotifyViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    lazy var dataManager: AlarmDataManger = AlarmDataManger()
    var AlarmData : [AlarmResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.AlarmItem(vc: self)
        
        tableView.dataSource = self
        tableView.delegate = self
        let notifyNib = UINib(nibName: "NotifyTableViewCell", bundle: nil)
        tableView.register(notifyNib, forCellReuseIdentifier: "NotifyTableViewCell")
        
    }
}

extension NotifyViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0{
                return "오늘"
            }
            else{
                return "이번 주"
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmData.count
//        if section == 0{
//            return 1
//        }
//        else{
//            return 15
//        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0){
            return 50
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyTableViewCell", for: indexPath) as! NotifyTableViewCell
        
        
//        if indexPath.section == 0 {
//            return cell
//        }else{
//            return cell
//        }
        if let urlString = AlarmData[indexPath.row].userImage{
                    
            let url = URL(string: urlString)
            cell.userImage.kf.setImage(with: url)
        }
        
        let cellUserID =  AlarmData[indexPath.row].userId!
        cell.contentLabel.text = "USER \(cellUserID) 님이 \(AlarmData[indexPath.row].content!)"
        
        return cell

    }
    
    
}
extension NotifyViewController{
    func SuccessAlarm(_ result: AlarmResponse) {
        print("댓글 화면 피드 화면 정보 가져오기 성공!\(result.message!)")
        AlarmData = result.result
        print(AlarmData)
        tableView.reloadData()
    }
    func failedToAlarm(message: String) {
        print("\(message)")
    }
}
    
