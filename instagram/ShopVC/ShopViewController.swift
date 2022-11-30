//
//  ShopViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/30.
//

import Foundation
import UIKit

class ShopViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        ShopCollectionViewCellOne
        let cellOne = UINib(nibName: "ShopCollectionViewCellOne", bundle: nil)
        collectionView.register(cellOne, forCellWithReuseIdentifier: "ShopCollectionViewCellOne")
        
        let cellTwoNib = UINib(nibName: "ShopCollectionViewCellTwo", bundle: nil)
        collectionView.register(cellTwoNib, forCellWithReuseIdentifier: "ShopCollectionViewCellTwo")
        
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
            return 25
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
