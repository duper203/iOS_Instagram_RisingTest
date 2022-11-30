//
//  HomeViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let img = info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage

        
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
        
        nextVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
//
//        if let img = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage{
//            print("이미지 선택 완료")

            nextVC.uploadImgView.image = img
//                itemImg.image = img as? UIImage
//            }
        
        
        
//            dismiss(animated: true, completion: nil)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0){
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
