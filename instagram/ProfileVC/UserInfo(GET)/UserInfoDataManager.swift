//
//  UserInfoDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/07.
//

import Foundation
import Alamofire

class MyInfoDataManager {
    func MyInfoItem(vc: ProfileViewController) {
        let url = "\(Constant.BASE_URL)/user/1"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjcsImlhdCI6MTY3MDE1NDYzOCwiZXhwIjoxNjcxNjI1ODY3fQ.vRNXNZtjN2NSY_-XqvmKlWIp1uDrbxvnVglwg4i1B3E"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyInfoResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessMyInfo(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToMyInfo(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
