//
//  LikesTableViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import UIKit

class LikesTableViewCell: UITableViewCell {
    let searchController = UISearchController(searchResultsController: nil)
    
    func setSearchBar(){
        searchController.searchBar.placeholder = "검색"
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setSearchBar()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
