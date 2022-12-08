//
//  AlarmDataManager.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/09.
//

import Foundation
import Alamofire

class AlarmDataManger {
    func AlarmItem(vc: NotifyViewController) {
        let url = "\(Constant.BASE_URL)/alarm"
        
        let header: HTTPHeaders = [ "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjksImlhdCI6MTY3MDM4MDE2NiwiZXhwIjoxNjcxODUxMzk1fQ.NBIv9uaj-ijqRZqoWSA8FvbTcHwRpJjXPaExtGdoROs"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: AlarmResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.SuccessAlarm(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToAlarm(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
