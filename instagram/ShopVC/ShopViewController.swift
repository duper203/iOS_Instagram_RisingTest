//
//  ShopViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/30.
//

import Foundation
import UIKit
import Kingfisher

class ShopViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    
    //DataManager
    lazy var dataManager: ShopDataManager = ShopDataManager()
    var shopData: [ShopResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //GET
        dataManager.ShopItem(vc: self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        ShopCollectionViewCellOne
        let cellOne = UINib(nibName: "ShopCollectionViewCellOne", bundle: nil)
        collectionView.register(cellOne, forCellWithReuseIdentifier: "ShopCollectionViewCellOne")
        
        let cellTwoNib = UINib(nibName: "ShopCollectionViewCellTwo", bundle: nil)
        collectionView.register(cellTwoNib, forCellWithReuseIdentifier: "ShopCollectionViewCellTwo")
        
        print("shop화면에서")

        
    }
}

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return 1
        default:
            print(shopData.count + 1)
            return shopData.count
            
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCellOne", for: indexPath) as? ShopCollectionViewCellOne else{
                
                return UICollectionViewCell()
            }
            return cell
            
        default:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCellTwo", for: indexPath) as? ShopCollectionViewCellTwo else{
                
                return UICollectionViewCell()
            }
            
            if let urlString = shopData[indexPath.item].url{
                print(urlString)
                
                let url = URL(string: urlString)
                cell.shopImageView.kf.setImage(with: url)
            }
            return cell
        }
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(100))
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            print(side)
            return CGSize(width: 130, height: 130)
            
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

extension ShopViewController {
    func SuccessShop(_ result: ShopResponse) {
        print("shop화면 정보 가져오기 성공!\(result.message!)")
        
        print(result.result)
        shopData = result.result
        collectionView.reloadData()
        
    }
    
    func failedToShop(message: String) {
        
        print("\(message)")
    }
}
