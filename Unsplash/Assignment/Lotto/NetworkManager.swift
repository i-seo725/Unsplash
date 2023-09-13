//
//  NetworkManager.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/13.
//

import Foundation
import Alamofire

struct LottoNetworkManager {
    
    private init() { }
    static let shared = LottoNetworkManager()
    
    func callRequest(drwNo: Int, completionHandler: @escaping (Lotto) -> Void) {
        guard let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)") else {
            print("유효하지 않은 주소")
            return
        }
        
        AF.request(url, method: .get).validate(statusCode: 200...600).responseDecodable(of: Lotto.self, completionHandler: { response in
            if let status = response.response?.statusCode {
                
                switch status {
                case 200..<300:
                    if let result = response.value {
                        completionHandler(result)
                    }
                default:
                    print(response.error)
                }
                
            }
        })
        
    
    }
    
    
}
