//
//  ReelsViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit
import SnapKit
import AVFoundation

class ReelsViewController: UIViewController{
    
    //DataManager
    lazy var dataManager:  ReelsDataManager = ReelsDataManager()
    
    var ReelsData: ReelsResult = ReelsResult()
    var player = AVPlayer()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GET
        dataManager.ReelsItem(vc: self)
        
        //collectionview setup
        collectionView.delegate = self
        collectionView.dataSource = self
        let FeedNib = UINib(nibName: "ReelsCollectionViewCell", bundle: nil)
        collectionView.register(FeedNib, forCellWithReuseIdentifier: "ReelsCollectionViewCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        player.play()
    }
    override func viewDidDisappear(_ animated: Bool) {
        player.pause()
    }
    
}
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReelsCollectionViewCell", for: indexPath) as? ReelsCollectionViewCell else{
            return UICollectionViewCell()
        }
//        if let urlString = ReelsData[indexPath.item].url{
//            print(urlString)
//
//            cell.setupURL(urlString)
//
//        }
        //ReelsData.url : 릴스영상 url
        let reelsUrlString = ReelsData.url
        if let urlString = URL(string: reelsUrlString){
            print(urlString)
        
            player = AVPlayer(url: urlString)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.view.bounds
            playerLayer.videoGravity = .resizeAspect
            self.view.layer.addSublayer(playerLayer)
            player.play()
        }
    
        
        return cell
        
    }
    
    
    
}
extension ReelsViewController {
    func SuccessReels(_ result: ReelsResponse) {
        print("릴스 화면 정보 가져오기 성공!\(result.message!)")
        
        print(result.result)

        ReelsData = result.result
        collectionView.reloadData()
        
    }
    
    func failedToReels(message: String) {
        
        print("\(message)")

    }
}
////ReelsData.url : 릴스영상 url
//if let urlString = URL(string: ReelsData[indexPath.row].url!){
//    print(urlString)
//
//    let player = AVPlayer(url: urlString)
//    let playerLayer = AVPlayerLayer(player: player)
//    playerLayer.frame = self.view.bounds
//    playerLayer.videoGravity = .resizeAspect
//    self.view.layer.addSublayer(playerLayer)
//    player.play()
//}
