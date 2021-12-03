//
//  YJMainService.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation
import Alamofire

struct YJMainService{
    static let shared = YJMainService()
    
    func requestGetCafeList(completion: @escaping (NetworkResult<Any>)->(Void)){
        let url = APIConstant.home
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
            ]
       
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData{ dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeGetStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
    }
    
    private func judgeGetStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isValidGetData(data: data)
        case 400: return .pathErr(data)//(data)라고 넣어주는거 맞나 ..?
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidGetData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(MainModel.self, from: data)
            else { return .pathErr(data) }
        return .success(decodedData)
    }
}
