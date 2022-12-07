//
//  UserInfoResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
struct MyInfoResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: MyInfoResult
}
struct MyInfoResult: Decodable {
    
    var userId : Int?
    var loginId : String?
    var name: String?
    var content: String?
    var imageUrl : String?
}

