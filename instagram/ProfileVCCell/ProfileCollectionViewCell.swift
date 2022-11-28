//
//  ProfileCollectionViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileBtn: UIButton!
    
    @IBOutlet weak var recommendFollowingBtn: UIButton!
    @IBOutlet weak var updateProfileBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.cornerRadius = 44
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.gray.cgColor
        profileImageView.layer.borderWidth = 1
        addProfileBtn.layer.cornerRadius = 12
        updateProfileBtn.layer.cornerRadius = 5
        recommendFollowingBtn.layer.cornerRadius = 5
        
    }

}
