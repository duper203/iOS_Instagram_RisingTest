//
//  RegisterLastVC.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/05.
//

import UIKit
import Alamofire

class RegisterLastVC: UIViewController{
    var validName = false
    var validPss = false
    var validAge = false
    var validUser = false
    
    var name: String = ""
    var pss: String = ""
    var age: String = ""
    var user: String = ""

    
    
    lazy var dataManager: RegisterDataManager = RegisterDataManager()

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var pssTextfield: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        turnBtnColor()
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        
        registerAccount.name = nameTextfield.text!
        registerAccount.password = pssTextfield.text!
        registerAccount.nickname = usernameTextfield.text!
        registerAccount.age = Int(ageTextfield.text!)!
        
        //회원가입 하기
        let input = RegisterRequest(loginId: registerAccount.loginId, type: registerAccount.type, name: registerAccount.name, nickname: registerAccount.nickname, password: registerAccount.password, age: registerAccount.age)
        
        dataManager.postRegister(input, delegate: self)
        
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func nameTextfield(_ sender: Any) {
        print("name 추가")
        self.validName = nameTextfield.text!.count > 2
        print(validName)
        name = nameTextfield.text!
        print(name)
    }
    @IBAction func pssTextfield(_ sender: Any) {
        print("pss 추가")
        self.validPss = pssTextfield.text!.count > 2
        pss = pssTextfield.text!

    }
    @IBAction func ageTextfield(_ sender: Any) {
        print("age 추가")
        self.validAge = ageTextfield.text!.count > 2
        age = ageTextfield.text!

    }
    @IBAction func usernameTextfield(_ sender: Any) {
        print("user 추가")
        self.validUser = usernameTextfield.text!.count > 2
        user = usernameTextfield.text!
    }
    
    
}
extension RegisterLastVC{
    func didSuccessRegister(_ result: RegisterResponse) {
        print("회원가입 성공")
        
//        self.presentAlert(title: "로그인에 성공하였습니다", message: result.token)
    }
}
