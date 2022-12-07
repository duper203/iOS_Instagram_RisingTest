//
//  FeedDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import Alamofire

class FeedDataManger {
    func FeedItem(vc: HomeViewController) {
        let url = "\(Constant.BASE_URL)/feed"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjksImlhdCI6MTY3MDM4MDE2NiwiZXhwIjoxNjcxODUxMzk1fQ.NBIv9uaj-ijqRZqoWSA8FvbTcHwRpJjXPaExtGdoROs"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: FeedResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessFeed(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToFeed(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
