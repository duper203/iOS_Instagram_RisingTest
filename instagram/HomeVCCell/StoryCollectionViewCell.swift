//
//  StoryCollectionViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileBgOne: UIView!
    @IBOutlet weak var profileBgTwo: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileBgOne.layer.cornerRadius = 24
        profileBgTwo.layer.cornerRadius = 23.5
        profileImg.layer.cornerRadius = 22.5
        profileImg.clipsToBounds = true
    }

}
