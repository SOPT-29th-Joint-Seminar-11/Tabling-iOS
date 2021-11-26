//
//  NamjoonModel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import Foundation
import UIKit

struct Store {
    var name: String
    var imageName: String
    var score: Int
    var reviewCount: Int
    var category: String
    var location: String
    var canBookNow: Bool
    var canLineUpNow: Bool
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
