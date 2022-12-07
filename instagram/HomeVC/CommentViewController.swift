//
//  CommentViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/30.
//

import Foundation
import UIKit

class CommentViewController:UIViewController{
    
    @IBAction func backBtn(_ sender: Any) {
    }
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //DataManager
    lazy var dataManager: FeedCommentDataManger = FeedCommentDataManger()
    var FeedCommentData: [FeedCommentResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GET
        dataManager.FeedCommentItem(vc: self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //feedtableviewcell 등록
        let feedNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "CommentTableViewCell")
    }
    
    
            
}
extension CommentViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else{
                return UITableViewCell()
            }
            
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 80
        }else{
            return 50
        }
    }
    
    
    
    
    
}

//FEED COMMENT
extension CommentViewController{
    func SuccessFeedComment(_ result: FeedCommentResponse) {
        print("댓글 화면 피드 화면 정보 가져오기 성공!\(result.message!)")
        FeedCommentData = result.result
        print(FeedCommentData)
        tableView.reloadData()
    }
    func failedToFeedComment(message: String) {
        print("\(message)")
    }
}
    
