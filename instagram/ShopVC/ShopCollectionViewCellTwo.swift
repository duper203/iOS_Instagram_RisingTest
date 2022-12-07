//
//  ShopCollectionViewCellTwo.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/30.
//

import UIKit

class ShopCollectionViewCellTwo: UICollectionViewCell {

    @IBOutlet weak var shopImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shopImageView.clipsToBounds = true
    }

}
