//
//  ReserveModel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/03.
//

import Foundation

// MARK: - ReserveModel

struct ReserveModel: Codable {
    let status: Int
    let success: Bool
    let data: ReserveData?
}

// MARK: - ReserveData

struct ReserveData: Codable {
    let id, restaurantID: Int
    let flag: Bool
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case restaurantID = "restaurantId"
        case flag, createdAt, updatedAt
    }
}
