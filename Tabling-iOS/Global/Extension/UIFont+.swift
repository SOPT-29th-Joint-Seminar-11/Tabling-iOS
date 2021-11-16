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
    
    class func notoBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: NotoSans.bold, size: size)!
    }
    
    class func notoMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: NotoSans.medium, size: size)!
    }
    
    class func notoRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: NotoSans.regular, size: size)!
    }
}

public enum Font {
    
    // MARK: - Main
    
    public static let mSubtitle = UIFont.notoBold(ofSize: 17)
    public static let mStoreTitle = UIFont.notoMedium(ofSize: 15)
    public static let mAddress = UIFont.notoBold(ofSize: 15)
    public static let mRvComment = UIFont.notoMedium(ofSize: 13)
    public static let mRvStoretitle = UIFont.notoBold(ofSize: 14)
    public static let mRvCaption = UIFont.notoMedium(ofSize: 12)
    public static let mRvStar = UIFont.notoMedium(ofSize: 15)
    public static let mRvTime = UIFont.notoMedium(ofSize: 12)
    public static let mIC = UIFont.notoRegular(ofSize: 11)
    public static let mStoreCaption = UIFont.notoRegular(ofSize: 13)
    public static let mStoreStar = UIFont.notoMedium(ofSize: 13)
    public static let mSearch = UIFont.notoRegular(ofSize: 14)
    public static let mBannerSub = UIFont.notoRegular(ofSize: 14)
    public static let mBannerTitle = UIFont.notoBold(ofSize: 17)
}
