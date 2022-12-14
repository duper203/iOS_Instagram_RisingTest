//
//  RegisterRespond.swift
//  instagram
//
//  Created by κΉνμ on 2022/12/08.
//

import Foundation

struct RegisterResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: RegisterResult?
}

struct RegisterResult: Decodable {
    var userId: Int?
    var jwt: String?
}
