//
//  SearchViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating{
    
    @IBOutlet weak var FeedcollectionView: UICollectionView!
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
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
        return 35
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = FeedcollectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath) as? FeedCollectionViewCell else{
            return UICollectionViewCell()
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
