//
//  FeedResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
struct FeedResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [FeedResult]
}

struct FeedResult: Decodable {
    
    var feedId: Int?
    var userId: Int?
    var name: String?
    var userImage: String?
    var image: String?
    var imageCount: Int?
    var likeCount: Int?
    var content: String?
    
}
