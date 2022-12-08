//
//  AlarmResponse.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/09.
//

import Foundation
struct AlarmResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [AlarmResult]
}

struct AlarmResult: Decodable {
    
    var alarm: Int?
    var userId: Int?
    var userImage: String?
    
}
