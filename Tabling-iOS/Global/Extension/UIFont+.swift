//
//  UIFont+.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/16.
//

import UIKit

/*
 
 Description:
 - UIFont.noto(type: .bold, size: 12)
 
*/

extension UIFont {
    
    class func noto(type: NotoSansKRType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }

    public enum NotoSansKRType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"

        var name: String {
            "NotoSansCJKkr-" + self.rawValue
        }
    }
}
