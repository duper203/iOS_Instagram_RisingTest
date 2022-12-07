//
//  MyFeedDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Alamofire

class MyFeedDataManager {
    func MyFeedItem(vc: ProfileViewController) {
        let url = "\(Constant.BASE_URL)/feed/1"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjksImlhdCI6MTY3MDM4MDE2NiwiZXhwIjoxNjcxODUxMzk1fQ.NBIv9uaj-ijqRZqoWSA8FvbTcHwRpJjXPaExtGdoROs"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyFeedResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessMyFeed(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToMyFeed(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
