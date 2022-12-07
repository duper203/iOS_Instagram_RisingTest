//
//  SearchViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating{
    //DataManager
    lazy var dataManager: SearchDataManager = SearchDataManager()
    var searchData: [SearchResult] = []
    
    //searchController
    let searchController = UISearchController()


    @IBOutlet weak var FeedcollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchController
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        //GET
        dataManager.SearchItem(vc: self)
        
        //collectionview
        FeedcollectionView.delegate = self
        FeedcollectionView.dataSource = self
        let FeedNib = UINib(nibName: "FeedCollectionViewCell", bundle: nil)
        FeedcollectionView.register(FeedNib, forCellWithReuseIdentifier: "FeedCollectionViewCell")
    }
    
    func updateSearchResults(for searchController: UISearchController){
        guard let text = searchController.searchBar.text else{
            return
        }
        print(text)
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = CGFloat((collectionView.frame.width / 3) - (4/3))
        return CGSize(width: side, height: side)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(1)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat(1)
        
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
//        self.presentAlert(title: message)
    }}
