//
//  RecommendDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import Alamofire

class RecommendDataManager {
    func RecommendItem(vc: FollowRecommendViewController) {
        let url = "\(Constant.BASE_URL)/user/1/recommend"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjEsImlhdCI6MTY3MDEzODI3MiwiZXhwIjoxNjcxNjA5NTAxfQ.z4wRPsQLNlwC9LRMRkUQgz6Ck9PL-8xp6igAN3FwqoE"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: RecommendResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessRecommend(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToRecommend(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
