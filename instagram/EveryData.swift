//
//  EveryData.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation

protocol CellDelegate: AnyObject{
    func buttondidtap()
    func recommendFollowTap()
}



//홈화면(2) cell누를 때 상세정보 화면전환시 데이터 전달로 사용

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

//홈화면(4)  cell누를 때 상세정보 화면전환시 데이터 전달로 사용

var shopIndex : Int?

struct ShopIndexResult{
    var itemId : Int?
    var shopId : Int?
    var name : String?
    var content : String?
    var price : Int?
    var url : String?
}
var shopDetailResult : ShopIndexResult = ShopIndexResult()


//
struct MyFeedIndexResult{
    
    var feedId : Int?
    var userId : Int = 0
    var content : String?
    var status : Int?
    var createdAt: String?
    var image : String?
    var likeFlag: Int = 0
    var userimage : String?
    

}

var MyFeedDetailResult : MyFeedIndexResult = MyFeedIndexResult()

var FeedIdx: Int = 0
