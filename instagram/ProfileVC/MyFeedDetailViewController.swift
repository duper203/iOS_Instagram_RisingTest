//
//  File.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
import UIKit

class MyFeedDetailViewController: UIViewController{
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameLabelTwo: UIButton!
    @IBOutlet weak var LikeLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        print(MyFeedDetailResult.userimage!)
        print(MyFeedDetailResult.image!)

        let urlprofile = URL(string: MyFeedDetailResult.userimage!)
        userImageView.kf.setImage(with: urlprofile)
        
        let url = URL(string: MyFeedDetailResult.image!)
        image.kf.setImage(with: url)


        userNameLabel.text = "USER \(String(describing: MyFeedDetailResult.userId))"
        userNameLabelTwo.setTitle("USER \(String(describing: MyFeedDetailResult.userId))", for: .normal)
        detailTextLabel.text = MyFeedDetailResult.content
        LikeLabel.text = "좋아요 \(String(describing: MyFeedDetailResult.likeFlag))개"
        
        
        userImageView.layer.cornerRadius = 20
        userImageView.clipsToBounds = true
        userImageView.layer.borderColor = UIColor.gray.cgColor
        userImageView.layer.borderWidth = 1

    }
}

