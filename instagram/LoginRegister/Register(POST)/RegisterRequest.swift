//
//  RegisterRequest.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation

struct RegisterRequest: Encodable {
    
    var loginId: String//email또는 전번
    var type: Int

    var name : String
    var nickname: String
    var password : String
    var age: Int
//    var email: String
//    var phone: String
}
