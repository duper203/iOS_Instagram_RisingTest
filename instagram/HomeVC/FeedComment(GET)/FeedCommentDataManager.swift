//
//  FeedCommentDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import Alamofire

class FeedCommentDataManger {
    func FeedCommentItem(vc: CommentViewController) {
        let url = "\(Constant.BASE_URL)/feed/18/comment"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjksImlhdCI6MTY3MDM4MDE2NiwiZXhwIjoxNjcxODUxMzk1fQ.NBIv9uaj-ijqRZqoWSA8FvbTcHwRpJjXPaExtGdoROs"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: FeedCommentResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessFeedComment(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToFeedComment(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
