//
//  FeedCommentResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
struct FeedCommentResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [FeedCommentResult]
}

struct FeedCommentResult: Decodable {
    
    var feedId: Int?
    var commentId: Int?
    var content: String?
    var userId: Int?
    var image : String?
    
}
