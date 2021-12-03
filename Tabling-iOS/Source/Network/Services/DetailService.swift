//
//  DetailService.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation

import Moya

enum DetailService {
    case detail(Int)
    case like(Int)
    case reserve(Int)
}

extension DetailService: TargetType {
    var baseURL: URL {
        return URL(string: APIConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .detail(let param):
            return "/cafe-detail/\(param)"
        case .like(let param):
            return "/cafe-detail/\(param)/like"
        case .reserve(let param):
            return "/cafe-detail/\(param)/reserve"
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .detail, .reserve, .like:
            return JSONEncoding.default
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .detail:
            return .get
        case .like, .reserve:
            return .post
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .detail:
            return .requestPlain
        case .like:
            return .requestPlain
        case .reserve:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
