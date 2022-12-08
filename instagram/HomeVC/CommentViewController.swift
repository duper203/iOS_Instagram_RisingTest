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
    
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //DataManager
    lazy var dataManager: FeedCommentDataManger = FeedCommentDataManger()
    var FeedCommentData: [FeedCommentResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImage.layer.cornerRadius = 25
        userProfileImage.clipsToBounds = true

        dataManager.FeedCommentItem(vc: self)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
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
            return FeedCommentData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            //해당 피드게시글의 유저 프로필 사진
            let urlString = mycomment.imageUrl!
            let url = URL(string: urlString)
            cell.userImage.kf.setImage(with: url)
            
            //해당 게시글 유저의 상세 내용
            let mycontent = mycomment.content!
            
            //해당 게시글 유저의 프로필 사진
            let myId = mycomment.userid!
            cell.commentLabel.text = "USER\(myId)  \(mycontent)"
            
            
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else{
                return UITableViewCell()
            }
            //댓글 쓴 유저 아이디
            let commentUserId = FeedCommentData[indexPath.row].userId!
            //댓글 내용
            let commentContent = FeedCommentData[indexPath.row].content!
            
            cell.commentLabel.text = "USER\(commentUserId)  \(commentContent)"
            
            //유저 프로필 사진
            let urlString = FeedCommentData[indexPath.row].image!
            let url = URL(string: urlString)
            cell.userImage.kf.setImage(with: url)
            
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 80
        }else{
            return 65
            
        
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
    
