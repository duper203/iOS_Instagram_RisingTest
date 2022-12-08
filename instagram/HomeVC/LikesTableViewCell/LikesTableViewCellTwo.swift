//
//  LikesTableViewCellTwo.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import UIKit

class LikesTableViewCellTwo: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = 27.5
        userImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
