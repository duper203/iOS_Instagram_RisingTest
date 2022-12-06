//
//  SignInRequest.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/05.
//

import Foundation

struct SignInRequest: Encodable {
    var loginId: String
    var password: String
}
