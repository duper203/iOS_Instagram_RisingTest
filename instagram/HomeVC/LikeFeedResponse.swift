//
//  LikeFeed(POST).swift
//  instagram
//
//  Created by 김혜수 on 2022/12/09.
//

import Foundation

struct LikeFeedResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: LikeFeedResult?
}

struct LikeFeedResult: Decodable {
    var feedId: Int?
    var userId: Int?
    var count: Int?
}
