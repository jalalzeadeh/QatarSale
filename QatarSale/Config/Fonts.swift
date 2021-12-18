//
//  Fonts.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
import UIKit

struct Fonts {
    // MARK: fonts names
    private static let fontBold = "Nunito-Bold"
    private static let fontMedium = "Nunito-Medium"
    private static let fontRegular = "Nunito-Regular"
    
    
    // MARK: font sizes
    public static let sizeXXBig: Double = 32
    public static let sizeXBig: Double = 28
    public static let sizeBig: Double = 20
    public static let sizeNormal: Double = 18
    public static let sizeSmall: Double = 14
    public static let sizeXSmall: Double = 12
    public static let sizeXXSmall: Double = 10
    
    public enum FontWeight {
        case bold
        case medium
        case regular
        case thin
    }
    
    // MARK: fonts getters
    /// font to be used in the app
    /// Size: 32
    static var xXBig: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXXBig  ))!
    }
    
    static var xXBigMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXXBig  ))!
    }
    
    static var xXBigBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXXBig  ))!
    }
    /// Size: 28
    static var xBig: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXBig  ))!
    }
    
    static var xBigMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXBig  ))!
    }
    
    static var xBigBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXBig  ))!
    }
    
    /// Size: 20
    static var big: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeBig  ))!
    }
    
    static var bigMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeBig  ))!
    }
    
    static var bigBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeBig  ))!
    }
    
    /// Size: 16
    static var normal: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeNormal  ))!
    }
    
    static var normalMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeNormal ))!
    }
    
    static var normalBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeNormal))!
    }
    
    /// Size: 14
    static var small: UIFont {
        let fontName = getFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeSmall))!
    }
    
    static var smallMedium: UIFont {
        let fontName = getFontName(weight:.medium)
        return UIFont(name: fontName, size: CGFloat(sizeSmall ))!
    }
    
    static var smallBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeSmall ))!
    }
    
    /// Size: 12
    static var xSmall: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall ))!
    }
    
    static var xSmallMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall ))!
    }
    
    static var xSmallBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall ))!
    }
    
    /// Size: 10
    static var xXSmall: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall ))!
    }
    
    static var xXSmallMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall ))!
    }
    
    static var xXSmallBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall ))!
    }
    
    
    /// Get font name
    private static func getFontName(weight: FontWeight) -> String {
        switch weight {
        case .bold:
            return fontBold
        case .medium:
            return fontMedium
        case .regular:
            return fontRegular
        case .thin:
            return fontRegular
        }
    }
    
    /// Get custom font
    public static func getCustomFont(weight: FontWeight, size: Double) -> UIFont {
        let fontName = getFontName(weight: weight)
        return UIFont(name: fontName, size: CGFloat(size) )!
    }
}
