//
//  Config.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
import UIKit

enum Languages: String {
    case english
    case arabic
    
    var key: String {
        switch self {
        case .arabic:
            return "ar"
        case .english:
            return "en"
        }
    }
}
    
var appLanguage = Languages.english
var isiPhone: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
}

struct Config {
    
    
}

//extension Notification.Name {
//    static let test = Notification.Name(rawValue: "test")
//}

enum ScreenSize {
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

class General {
    static var shared = General()
    
}


// localization
let RTL_LANGUAGES = ["ar"]

