//
//  ShopResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/06.
//

import Foundation
struct ShopResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: [ShopResult]
}
struct ShopResult: Decodable {
    
    var itemId : Int?
    var shopId : Int?
    var name : String?
    var content : String?
    var price : Int?
    var url : String?
    var status : String?
    var createdAt: String?
}
