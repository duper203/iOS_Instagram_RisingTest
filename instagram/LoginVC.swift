//
//  LoginVC.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit

class LoginVC: UIViewController{
    
    @IBAction func registerbtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
