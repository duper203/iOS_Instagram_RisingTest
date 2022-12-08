//
//  ShopDetailDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import Alamofire

class ShopDetailDataManager {
    func ShopDetailItem(vc: ShopDetailViewController, shopIndex: Int) {
        let url = "\(Constant.BASE_URL)/item/\(shopIndex)"
        
//        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjcsImlhdCI6MTY3MDE1NDYzOCwiZXhwIjoxNjcxNjI1ODY3fQ.vRNXNZtjN2NSY_-XqvmKlWIp1uDrbxvnVglwg4i1B3E"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ShopDetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessShopDetail(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToShopDetail(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
