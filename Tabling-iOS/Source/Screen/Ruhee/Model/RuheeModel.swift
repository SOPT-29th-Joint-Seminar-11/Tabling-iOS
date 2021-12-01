//
//  RuheeModel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/20.
//

import Foundation

// MARK: - Welcome
struct DetailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: StoreData
}

// MARK: - DataClass
struct StoreData: Codable {
    let info: Info
    let detail: Detail
}

// MARK: - Detail
struct Detail: Codable {
    let tags: [String]
    let pet, wifi, parking: Int
}

// MARK: - Info
struct Info: Codable {
    let images: [String]
    let waitingCount: Int
    let distance: Double
    let name, address: String
    let rating, reviewCount: Int
    let infoDescription: String
    let likeFlag: Bool
    let likeCount: Int

    enum CodingKeys: String, CodingKey {
        case images, waitingCount, distance, name, address, rating, reviewCount
        case infoDescription = "description"
        case likeFlag, likeCount
    }
}
