//
//  FeedLikesResponse.swift
//  instagram
//
//  Created by κΉνμ on 2022/12/08.
//

import Foundation

struct FeedLikesResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [FeedLikesResult]
}

struct FeedLikesResult: Decodable {
    
    var nickname: String?
    var userId: Int?
    var image : String?
    
}
