//
//  UploadViewController.swift
//  instagram
//
//  Created by κΉνμ on 2022/11/29.
//

import Foundation
import UIKit
class UploadViewController: UIViewController{
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func uploadFeedBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var uploadImgView: UIImageView!
    
    func viewdidLoad(){
        super.viewDidLoad()
    }
    
}
