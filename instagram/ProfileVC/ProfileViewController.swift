//
//  ProfileViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    //MARK - DataManager: 프로필 피드
    lazy var dataManager: MyFeedDataManager = MyFeedDataManager()
    var MyFeedData: [MyFeedResult] = []
    
    //MARK - DataManager: 프로필 정보
    lazy var dataManagerTwo: MyInfoDataManager = MyInfoDataManager()
    var MyInfoData: MyInfoResult = MyInfoResult()
    
    //MARK - DataManager: 팔로워 팔로잉 정보
    lazy var dataManagerThree: FollowingDataManager = FollowingDataManager()
    var FollowingCount = 0
    var FollowingListData: userList = userList()
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK - GET 호출
        dataManager.MyFeedItem(vc: self)
        dataManagerTwo.MyInfoItem(vc: self)
        dataManagerThree.FollowingItem(vc: self)
        
        //MARK - collectionview setup
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let profileNib = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        collectionView.register(profileNib, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        
        let profileNib2 = UINib(nibName: "ProfileCollectionViewCellTwo", bundle: nil)
        collectionView.register(profileNib2, forCellWithReuseIdentifier: "ProfileCollectionViewCellTwo")
        
        let profileNib3 = UINib(nibName: "ProfileCollectionViewCellThree", bundle: nil)
        collectionView.register(profileNib3, forCellWithReuseIdentifier: "ProfileCollectionViewCellThree")
        
        
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return 1
        case 1:
            return 5
        default:
            return MyFeedData.count
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else{
                return UICollectionViewCell()
            }
            if let urlString = MyInfoData.imageUrl{
                print(urlString)
                
                let url = URL(string: urlString)
                cell.profileImageView.kf.setImage(with: url)
            }
            
            cell.UserName.text = MyInfoData.name
            cell.userContent.text = MyInfoData.content
            cell.followingNum.text = "\(String(describing: FollowingCount))"
            cell.feedCountLabel.text = "\(String(describing: MyFeedData.count))"
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCellTwo", for: indexPath) as? ProfileCollectionViewCellTwo else{
                return UICollectionViewCell()
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCellThree", for: indexPath) as? ProfileCollectionViewCellThree else{
                return UICollectionViewCell()
            }
            if let urlString = MyFeedData[indexPath.item].image{
                print(urlString)
                
                let url = URL(string: urlString)
                cell.myFeedImage.kf.setImage(with: url)
            }
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
        
        print(indexPath.row)
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MyFeedDetailViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
        MyFeedDetailResult.userId = MyFeedData[indexPath.item].userId!
        MyFeedDetailResult.content = MyFeedData[indexPath.item].content
        MyFeedDetailResult.image = MyFeedData[indexPath.item].image
        MyFeedDetailResult.likeFlag = MyFeedData[indexPath.item].likeFlag!
        
        
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(182))
        case 1:
            return CGSize(width: 50, height: 70)
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            return CGSize(width: side, height: side)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        case 1:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        case 1:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
}
extension ProfileViewController{
    func SuccessMyFeed(_ result: MyFeedResponse) {
        print("프로필 화면 정보 가져오기 성공!\(result.message!)")
        print(result.result)
        MyFeedData = result.result
        collectionView.reloadData()
    }
    
    func failedToMyFeed(message: String) { print("\(message)") }
    
    func SuccessMyInfo(_ result: MyInfoResponse) {
        print("프로필 user 정보 가져오기 성공!\(result.message!)")
        print(result.result)
        MyInfoData = result.result
        collectionView.reloadData()
    }
    
    func failedToMyInfo(message: String) { print("\(message)") }
    
    func SuccessFollowing(_ result: FollowingResponse) {
        print("팔로잉 정보 가져오기 성공!\(result.message!)")
        print(result.result)
//        FollowingListData = result.result.userList
        FollowingCount = result.result.count!
        collectionView.reloadData()
        print("팔로잉 수")
        print(FollowingCount)
    }
    
    func failedToFollowing(message: String) { print("\(message)") }
}
