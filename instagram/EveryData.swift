//
//  EveryData.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import Foundation

//홈화면(1)에 쓰이는 delegate
protocol CellDelegate: AnyObject{
    //댓글 창 넘어감
    func buttondidtap()
    
    //좋아요 창 넘어감
    func taptoLikes()
    
    func likeFeed()
}

var feedIdLikes = 0


//홈화면(5)에 쓰이는 delegate
protocol CellDelegateTwo: AnyObject{
    func recommendFollowTap()
}


//홈화면(1) 댓글창에 전의 정보 가져가기
struct MyComment{
    var imageUrl : String?
    var userid : String?
    var content : String?
}
var mycomment : MyComment = MyComment()

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


//회원가입
struct Register{
    
    var loginId: String = "" //email또는 전번
    var type: Int = 0

    var name : String = ""
    var nickname: String = ""
    var password : String = ""
    var age: Int = 0
    var email: String = ""
    var phone: String = ""

    

}
var registerAccount: Register = Register()
