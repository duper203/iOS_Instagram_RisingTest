//
//  ReelsResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/06.
//

import Foundation
struct ReelsResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: ReelsResult
}
struct ReelsResult: Decodable {
    
    var reelsId : Int?
    var userId : Int?
    var url : String = ""
    var content : String?
    var status : String?
    var createdAt: String?
}
