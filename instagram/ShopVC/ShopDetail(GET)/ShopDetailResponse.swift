//
//  ShopDetailResponse.swift
//  instagram
//
//  Created by κΉνμ on 2022/12/08.
//

import Foundation
struct ShopDetailResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: ShopDetailResult
}
struct ShopDetailResult: Decodable {
    
    var itemId : Int?
    var shopId : Int?
    var name : String?
    var content : String?
    var price : Int?
    var url : String?
    
}
