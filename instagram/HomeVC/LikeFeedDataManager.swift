//
//  LikeFeedDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/09.
//

import Foundation
import Alamofire

class LikeFeedDataManager {
    
    func postLike(_ parameters: LikeFeedRequest, delegate: HomeViewController) {
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjksImlhdCI6MTY3MDM4MDE2NiwiZXhwIjoxNjcxODUxMzk1fQ.NBIv9uaj-ijqRZqoWSA8FvbTcHwRpJjXPaExtGdoROs"]
        
        AF.request("\(Constant.BASE_URL)/user/feed/31/likes", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: LikeFeedResponse.self) { response in
                switch response.result {
                    
                case .success(let response):
                    // 성공했을 때
                    if((response.isSuccess) != nil) {
                        print("성공!!!!!!!!")
                        delegate.SuccessLikeFeed(response)
                        print(SignInResult())
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000:
                            print("2000")
                        case 3000:
                            print("3000")
                        case 4000:
                            print("4000")
                        default:
                            print("피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
