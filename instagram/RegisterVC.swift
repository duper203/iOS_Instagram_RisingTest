//
//  RegisterVC.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import Foundation
import UIKit
class RegisterVC: UIViewController{
    
    //이메일 주소로 가입하기 다음 단계
    @IBAction func RegisterUserBtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterTwoViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    //휴대폰으로 가입 할 화면으로 전환
    @IBAction func RegisterPhoneBtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterPhoneViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    //이미 계정이 있으신가요? >> 로그인 페이지로 다시 돌아가기
    @IBAction func loginBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
