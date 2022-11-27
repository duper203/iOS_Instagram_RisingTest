//
//  Register.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/27.
//

import Foundation
import UIKit

class Register: UIViewController{
    
    
    @IBOutlet weak var tapBarCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let tapBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 30)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
}
