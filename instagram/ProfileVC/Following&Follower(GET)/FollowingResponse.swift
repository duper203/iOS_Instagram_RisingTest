//
//  FollowingResponse.swift
//  instagram
//
//  Created by κΉνμ on 2022/12/07.
//

import Foundation
struct FollowingResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: FollowingResult
}
struct FollowingResult: Decodable {
    var count : Int?
    var userList : [userList]
}
struct userList: Decodable{
    var userId : Int?
    var name: String?
    var content: String?
    var imageUrl : String?

    
}
