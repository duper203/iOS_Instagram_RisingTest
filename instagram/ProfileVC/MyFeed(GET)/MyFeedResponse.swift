//
//  MyFeedResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
struct MyFeedResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: [MyFeedResult]
}
struct MyFeedResult: Decodable {
    
    var feedId : Int?
    var userId : Int?
    var image : String?
    var content : String?
    var likeFlag: Int?


}

