//
//  FeedTableViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import UIKit


class FeedTableViewCell: UITableViewCell {
    
    var delegate: CellDelegate?
    
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var likesBtn: UIButton!
    
    //댓글창 넘어가기
    @IBAction func commentBtn(_ sender: Any) {
        print("버튼 클릭")
        self.delegate?.buttondidtap()
    }
    @IBAction func commentImageBtn(_ sender: Any) {
        self.delegate?.buttondidtap()
    }
    
    //좋아요 목록으로 넘어가기
    @IBAction func likesBtn(_ sender: Any) {
        self.delegate?.taptoLikes()

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
