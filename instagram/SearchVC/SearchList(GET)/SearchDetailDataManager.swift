//
//  SearchDetailDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
import Alamofire

class SearchDetailDataManager {
    func SearchItem(vc: SearchDetailViewController) {
        let url = "\(Constant.BASE_URL)/search-list"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjcsImlhdCI6MTY3MDE1NDYzOCwiZXhwIjoxNjcxNjI1ODY3fQ.vRNXNZtjN2NSY_-XqvmKlWIp1uDrbxvnVglwg4i1B3E"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: SearchResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessSearch(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToSearch(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

