//
//  RecommendResponse.swift
//  instagram
//
//  Created by κΉνμ on 2022/12/08.
//

import Foundation

struct RecommendResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: [RecommendResult]
}
struct RecommendResult: Decodable {
    var userId : Int?
    var name : String?
    var imageUrl : String?
}
