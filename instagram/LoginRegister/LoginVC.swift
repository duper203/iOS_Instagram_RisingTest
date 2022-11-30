//
//  LoginVC.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit

class LoginVC: UIViewController{
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func loginBtn(_ sender: Any) {
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                nextVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//                nextVC.modalPresentationStyle = .fullScreen
//
//                self.present(nextVC, animated: true, completion: nil)
    }
    @IBAction func registerbtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
