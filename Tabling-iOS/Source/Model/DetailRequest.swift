//
//  DetailRequest.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation

struct DetailRequest: Codable {
    var cafeId: Int
    
    init(_ cafeID: Int) {
        self.cafeId = cafeID
    }
}
