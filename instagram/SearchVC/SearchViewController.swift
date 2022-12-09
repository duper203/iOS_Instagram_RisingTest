//
//  SearchViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit

class SearchViewController: UIViewController{
    
    
    //DataManager
    lazy var dataManager: SearchDataManager = SearchDataManager()
    var searchData: [SearchResult] = []
    
    //searchController
    //    let searchController = UISearchController()
    
    
    @IBOutlet weak var FeedcollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        
        //GET
        dataManager.SearchItem(vc: self)
        
        //collectionview
        FeedcollectionView.delegate = self
        FeedcollectionView.dataSource = self
        
        let FeedNibOne = UINib(nibName: "FeedCollectionViewCellOne", bundle: nil)
        FeedcollectionView.register(FeedNibOne, forCellWithReuseIdentifier: "FeedCollectionViewCellOne")
        
        let FeedNib = UINib(nibName: "FeedCollectionViewCell", bundle: nil)
        FeedcollectionView.register(FeedNib, forCellWithReuseIdentifier: "FeedCollectionViewCell")
        
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return searchData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        
        switch section{
        case 0:
            guard let cell = FeedcollectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCellOne", for: indexPath) as? FeedCollectionViewCellOne else{
                
                return UICollectionViewCell()
            }
            return cell
            
        default:
            
            guard let cell = FeedcollectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath) as? FeedCollectionViewCell else{
                return UICollectionViewCell()
            }
            if let urlString = searchData[indexPath.item].image{
                print(urlString)
                
                let url = URL(string: urlString)
                cell.searchFeedImage.kf.setImage(with: url)
            }
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
        detailResult.userId = searchData[indexPath.item].userId!
        detailResult.content = searchData[indexPath.item].content
        detailResult.image = searchData[indexPath.item].image
        detailResult.likeFlag = searchData[indexPath.item].likeFlag!
        
        
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(50))
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            print(side)
            return CGSize(width: side, height: side)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }

    }
    
}
extension SearchViewController{
    func SuccessSearch(_ result: SearchResponse) {
        print("shop화면 정보 가져오기 성공!\(result.message!)")
        
        print(result.result)
        searchData = result.result
        FeedcollectionView.reloadData()
        
    }
    
    func failedToSearch(message: String) {
        
        print("\(message)")
    }}
