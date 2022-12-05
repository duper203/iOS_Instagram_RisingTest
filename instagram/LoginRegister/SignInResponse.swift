//
//  SignInResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/05.
//

import Foundation

struct SignInResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: SignInResult?
}

struct SignInResult: Decodable {
    var userId: Int?
    var jwt: String?
}
