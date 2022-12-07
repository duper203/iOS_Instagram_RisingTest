//
//  EveryData.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation

var imageName: [String] = []

//cell누를 때 상세정보 화면전환시 데이터 전달로 사용

struct SearchIndexResult{
    
    var feedId : Int?
    var userId : Int = 0
    var content : String?
    var status : Int?
    var createdAt: String?
    var image : String?
    var likeFlag: Int = 0

}

var detailResult : SearchIndexResult = SearchIndexResult()
