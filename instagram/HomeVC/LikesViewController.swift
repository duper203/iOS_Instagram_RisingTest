//
//  LikesViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import UIKit


class LikesViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    //DataManager
    lazy var dataManager: LikesListDataManger = LikesListDataManger()
    
    var likesData: [FeedLikesResult] = []
    
    override func viewDidAppear(_ animated: Bool) {
        print("likes viewdidAppear")
        tableView.delegate = self
        tableView.dataSource = self
        
        print("likes화면")
        print(feedIdLikes)
        
        
        let feedNib = UINib(nibName: "LikesTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "LikesTableViewCell")
        
        let feedNibTwo = UINib(nibName: "LikesTableViewCellTwo", bundle: nil)
        tableView.register(feedNibTwo, forCellReuseIdentifier: "LikesTableViewCellTwo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        dataManager.LikesList(vc: self, feedId: feedIdLikes)

        
    }
}
extension LikesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print(likesData.count)
            return likesData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikesTableViewCell", for: indexPath) as? LikesTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikesTableViewCellTwo", for: indexPath) as? LikesTableViewCellTwo else{
                return UITableViewCell()
            }
//
            //유저 프로필 사진
            let urlString = likesData[indexPath.row].image!
            let url = URL(string: urlString)
            cell.userImage.kf.setImage(with: url)


            cell.userIdLabel.text = "\(likesData[indexPath.row].userId!)"
            cell.userIdLabel.text = likesData[indexPath.row].nickname!
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 40
        }else{
            return 65
            
            
        }
    }
}
extension LikesViewController{
    func SuccessLikesList(_ result: FeedLikesResponse) {
        print("좋아요 화면 피드 화면 정보 가져오기 성공!\(result.message!)")
        likesData = result.result
        print(likesData)
//        tableView.reloadData()
    }
    func failedToLikesList(message: String) {
        print("\(message)")
    }
}
    
