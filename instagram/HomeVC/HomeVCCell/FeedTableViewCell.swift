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
    
    
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBAction func commentBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myModalViewController = storyboard.instantiateViewController(withIdentifier: "CommentViewController")
        myModalViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        myModalViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        self.present
//        (myModalViewController, animated: true, completion: nil)
    }
    
    
    
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
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
