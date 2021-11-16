//
//  UIFont+.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/16.
//

import UIKit

struct NotoSans {
    static let bold = "NotoSansCJKkr-Bold"
    static let medium = "NotoSansCJKkr-Medium"
    static let regular = "NotoSansCJKkr-Regular"
}

extension UIFont {
    class func boldSans(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: NotoSans.bold, size: size)!
    }
    
    class func mediumsSans(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: NotoSans.medium, size: size)!
    }
    
    class func regularSans(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: NotoSans.regular, size: size)!
    }
}
