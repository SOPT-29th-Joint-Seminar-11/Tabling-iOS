//
//  MainModel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import Foundation

// MARK: - MainModel

struct MainModel: Codable {
    let status: Int
    let success: Bool
    let data: [MainData]
}

// MARK: - MainData

struct MainData: Codable {
    let id: Int
    let titleImage: String
    let name: String
    let rating, reviewCount: Int
    let groupType, location: String
    let reserveFlag, lineupFlag: Bool
}
