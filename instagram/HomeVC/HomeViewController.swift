//
//  HomeViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit


class HomeViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    let imagePickerController = UIImagePickerController()
    
    //DataManager
    lazy var dataManagerOne: FeedDataManger = FeedDataManger()
    var FeedData: [FeedResult] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        //GET
        dataManagerOne.FeedItem(vc: self)
            
            
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        //feedtableviewcell 등록
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        //(5) storytableviewcell 등록
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        //imagepicker
        imagePickerController.delegate = self
        
        
        
        
    }
    
    @IBAction func uploadFeed(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
    }
    
    
    //알림화면으로 전환
    
    @IBAction func notifyBtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "NotifyViewController")
                self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    
    @IBAction func DMBtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "DMViewController")
                self.navigationController?.pushViewController(pushVC!, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            print("cell몇개")
            print(FeedData.count)
            return FeedData.count
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            
            //까먹으면 안됨
            cell.delegate = self
            cell.selectionStyle = .none
            
            //피드 아이디 선정
            feedIdLikes = FeedData[indexPath.row].feedId!
            print(feedIdLikes)
            
            if let urlString = FeedData[indexPath.row].userImage{
                print(urlString)
                
                //댓글창에 넘길 유저 프로필
                mycomment.imageUrl = urlString
                
                let url = URL(string: urlString)
                
                cell.userProfile.kf.setImage(with: url)
            }
            
            if let urlString = FeedData[indexPath.row].image{
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            
            let userNameString = FeedData[indexPath.row].userId!
            
            //댓글창에 넘길 유저 아이디
            mycomment.userid = "\( userNameString)"
            
            let likeString = FeedData[indexPath.row].likeCount!
            
            cell.userName.text = "\( userNameString)"
            
            //댓글창에 넘길 피드의 상세내용
            mycomment.content = FeedData[indexPath.row].content
            
            cell.explainLabel.text = FeedData[indexPath.row].content
            
            
            cell.likesBtn.setTitle("좋아요 \( likeString)개", for: .normal)
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 80
        }else{
            return 600
        }
    }
    
    
    
    //(3) display되면서 collectionview 셀 설정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionView(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
}

//(4) 3개 다 필수적으로 들어가기!!
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //(6)collectionviewcell 파일과 스토리 보드 만들고
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            print(image)
        }
    }
    
}

extension HomeViewController: CellDelegate{
    
    
    func buttondidtap() {
        print("protocol")
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)

    }
    func taptoLikes(){
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "LikesViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
    }
    
    
}


//GET
extension HomeViewController {
    
    //FEED
    func SuccessFeed(_ result: FeedResponse) {
        print("홈 화면 피드 화면 정보 가져오기 성공!\(result.message!)")
        print(result.result)
        FeedData = result.result
        print(FeedData.count)

        tableView.reloadData()
    }
    func failedToFeed(message: String) {
        print("\(message)")
    }
    
    
    
    //FEED Likes
//    func SuccessFeedLikes(_ result: FeedResponse) {
//        print("홈 화면 피드 화면 정보 가져오기 성공!\(result.message!)")
//        tableView.reloadData()
//    }
//    func failedToFeedLikes(message: String) {
//        print("\(message)")
//    }
}

