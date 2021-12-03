//
//  DetailManager.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation

import Moya

class DetailManager {
    
    static let shared: DetailManager = DetailManager()
    private init() { }
    
    var cafeID: Int = 1
    private let detailProvider = MoyaProvider<DetailService>(plugins: [NetworkLoggerPlugin()])
    public var detailModel: DetailModel?
    private var likeModel: LikeModel?
    public private(set) var info: Info?
    public private(set) var detail: Detail?
    
    func fetchDetail(completion: @escaping (() -> ())) {
        detailProvider.request(.detail(cafeID)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                do {
                    self.detailModel = try result.map(DetailModel.self)
                    self.info = self.detailModel?.data?.info
                    self.detail = self.detailModel?.data?.detail
                    completion()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func postLike(cafeID: Int, completion: @escaping (() -> ())) {
        let param = DetailRequest.init(cafeID)

        detailProvider.request(.like(param: param)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                do {
                    self.likeModel = try result.map(LikeModel.self)
                    

                    completion()
                } catch(let err) {
                    print(err.localizedDescription, "에러이유")
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func postReserve(cafeID: Int, completion: @escaping (() -> ())) {
        let param = DetailRequest.init(cafeID)

        detailProvider.request(.reserve(param: param)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                do {
                    self.detailModel = try result.map(DetailModel.self)
                    completion()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
