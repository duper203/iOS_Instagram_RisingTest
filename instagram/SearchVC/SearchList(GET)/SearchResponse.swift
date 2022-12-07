//
//  SearchResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
struct SearchResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: [SearchResult]
}
struct SearchResult: Decodable {
    
    var feedId : Int?
    var userId : Int?
    var content : String?
    var status : Int?
    var createdAt: String?
    var image : String?
    var likeFlag : Int?

}


