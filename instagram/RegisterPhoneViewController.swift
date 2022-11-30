//
//  RegisterPhoneViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/30.
//

import Foundation
import UIKit

class RegisterPhoneViewController: UIViewController{
    
    @IBOutlet weak var loginBtn: UIButton!
    
    //휴대전화번호로 가입 진행하기 (다음단계)
    @IBAction func loginBtn(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterTwoViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    //다시 이메일로 회원가입할 화면으로 돌아가기
    @IBAction func emailRegisterBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //미이 계정이 있으신가요? 로그인 화면으로 돌아가기
    @IBAction func goBackBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
