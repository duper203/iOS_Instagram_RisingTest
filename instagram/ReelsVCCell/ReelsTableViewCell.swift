//
//  ReelsTableViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import UIKit

class ReelsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left:0, bottom: 2, right: 0))
    }
    
}
