//
//  DetailViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
import UIKit

class SearchDetailViewController: UIViewController{
    
        
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameLabelTwo: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var LikeLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    

    override func viewDidLoad(){
        super.viewDidLoad()
        
        let url = URL(string: detailResult.image!)
        image.kf.setImage(with: url)


        userNameLabel.text = "USER \(String(describing: detailResult.userId))"
        userNameLabelTwo.setTitle("USER \(String(describing: detailResult.userId))", for: .normal)
        detailTextLabel.text = detailResult.content
        LikeLabel.text = "좋아요 \(String(describing: detailResult.likeFlag))개"




    }
}

