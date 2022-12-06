//
//  SignInDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/05.
//

import Foundation
import Alamofire

class SignInDataManager {
    func postSignIn(_ parameters: SignInRequest, delegate: LoginVC) {
        
        print("SignInDataManager!!!!!!!")
        
        AF.request("\(Constant.BASE_URL)/user/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SignInResponse.self) { response in
                switch response.result {
                    
                case .success(let response):
                    // 성공했을 때
                    if((response.isSuccess) != nil) {
                        print("성공!!!!!!!!")
                        delegate.didSuccessSignIn(response)
                        print(SignInResult())
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000:
                            print("2000")
                        case 3000:
                            print("3000")
                        case 4000:
                            print("4000")
                        default:
                            print("피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)

                }
            }
    }
}
