//
//  LoginVC.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit
import Alamofire

class LoginVC: UIViewController{
    lazy var dataManager: SignInDataManager = SignInDataManager()
    var ID: String = ""
    var pss: String = ""
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginPss: UITextField!
    @IBOutlet weak var loginID: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        print("로그인 버튼 눌름")
        ID = loginID.text!
        pss = loginPss.text!
        
        print(ID)
        print(pss)
        
        let input = SignInRequest(loginId: ID, password: pss)
        
        dataManager.postSignIn(input, delegate: self)
        
        print("화면전환")
        
        
    }
    @IBAction func registerbtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}






extension LoginVC {
    func didSuccessSignIn(_ result: SignInResponse) {
        print("로그인에 성공")
        
        Constant.jwtToken = (result.result?.jwt)!
        print(Constant.jwtToken)
        
//        self.presentAlert(title: "로그인에 성공하였습니다", message: result.token)
    }
}
