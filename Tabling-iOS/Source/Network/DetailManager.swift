//
//  DetailManager.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation

import Moya

struct DetailManager {
    
    static let shared: DetailManager = DetailManager()
    private init() { }
    
    private let detailProvider = MoyaProvider<DetailService>(plugins: [NetworkLoggerPlugin(verbose: true)])

    public var detailModel = DetailModel()
    
    func fetchDetail(cafeId: Int, @escaping completion: (() -> ())) {
        
        let param = cafeId
        
        detailProvider.request(.detail(param)) { response in
            switch response {
                return 
            }
        }
        
    }
}
