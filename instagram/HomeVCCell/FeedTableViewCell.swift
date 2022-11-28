//
//  FeedTableViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var FeedComment: UILabel!
    @IBOutlet weak var userProfileTwo: UIImageView!
    
    @IBAction func btnHeart(_ sender: Any) {
        if btnHeart.isSelected{
            btnHeart.isSelected = false
        }else{
            btnHeart.isSelected = true
        }
    }
    @IBAction func btnBookmark(_ sender: Any) {
        if btnBookmark.isSelected{
            btnBookmark.isSelected = false
        }else{
            btnBookmark.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //프로필 사진 둥글게 만들기
        userProfile.layer.cornerRadius = 11
        userProfile.clipsToBounds = true
        userProfileTwo.layer.cornerRadius = 11
        userProfileTwo.clipsToBounds = true
        
        //label 안에 특정 부분만 볼드 및 크기 다르게
        let font = UIFont.boldSystemFont(ofSize: 9)
        let Str = NSMutableAttributedString(string: FeedComment.text ?? "")
        Str.addAttribute(.font, value: font, range: NSRange.init(location: 0, length: 5))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
