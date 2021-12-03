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
    public private(set) var detailModel: DetailModel?
    public private(set) var likeModel: LikeModel?
    public private(set) var reserveModel: ReserveModel?
    public private(set) var reserveData: ReserveData?
    public private(set) var info: Info?
    public private(set) var detail: Detail?
    
    // MARK: - GET : 가게 상세 가져오기
    
    func fetchDetail(completion: @escaping (() -> ())) {
        detailProvider.request(.detail(cafeID)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                do {
                    self.detailModel = try result.map(DetailModel.self)
                    self.info = self.detailModel?.data?.info
                    self.detail = self.detailModel?.data?.detail
                    print(self.detailModel?.status, self.detailModel?.message)
                    completion()
                } catch(let err) {
                    print(err.localizedDescription, "상세가져오기에러이유")
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // MARK: - POST 좋아요
    
    func postLike(cafeID: Int, completion: @escaping (() -> ())) {
        detailProvider.request(.like(cafeID)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                do {
                    self.likeModel = try result.map(LikeModel.self)
                    print("조아요",self.likeModel?.status, self.likeModel?.message)
                    completion()
                } catch(let err) {
                    print(err.localizedDescription, "좋아요에러이유")
                }
            case .failure(let err):
                print(err.localizedDescription, "좋아요에러이유")
            }
        }
    }
    
    // MARK: - POST 예약하기
    
    func postReserve(cafeID: Int, completion: @escaping (() -> ())) {
        detailProvider.request(.reserve(cafeID)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                do {
                    self.reserveModel = try result.map(ReserveModel.self)
                    self.reserveData = self.reserveModel?.data
                    print(self.reserveData)
                    print("postpostpost")
                    completion()
                } catch(let err) {
                    print(err.localizedDescription, "예약하기에러이유")
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
