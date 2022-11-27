//
//  Login.swift
//  
//
//  Created by 김혜수 on 2022/11/27.
//

import Foundation
import UIKit

class LoginVC: UIViewController{
    
    
    @IBAction func registerBtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "Register")
                self.navigationController?.pushViewController(pushVC!, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
