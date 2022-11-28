//
//  ProfileCollectionViewCellTwo.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import UIKit

class ProfileCollectionViewCellTwo: UICollectionViewCell {

    @IBOutlet weak var highlightImg: UIImageView!
    @IBOutlet weak var highlightBG: UIView!
    @IBOutlet weak var highlight: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        highlight.layer.cornerRadius = 24
        highlightBG.layer.cornerRadius = 23.5
        highlightImg.layer.cornerRadius = 23
        
    }

}
