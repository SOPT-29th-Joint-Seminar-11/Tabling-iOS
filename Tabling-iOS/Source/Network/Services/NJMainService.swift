//
//  NJMainService.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation
import Alamofire

struct NJMainService {
    
    static let shared = NJMainService()
    
    func getStoreList(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstant.home
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidStoreData(data: data)
        case 400: return .pathErr(statusCode)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidStoreData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(MainModel.self, from: data) else {return .pathErr("nil")}
        return .success(decodeData)
    }
}
