//
//  ShopCollectionViewCellTwo.swift
//  instagram
//
//  Created by κΉνμ on 2022/11/30.
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
