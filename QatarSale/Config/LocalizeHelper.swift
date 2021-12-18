//
//  LocalizeHelper.swift
//  TenTime
//
//  Created by Jhonny on 2/6/19.
//  Copyright © 2019 Jhonny. All rights reserved.
//
import Foundation
class TTLocalizeUtils: NSObject {
    
    static let defaultLocalizer = TTLocalizeUtils()
    var appbundle = Bundle.main
    
    func setSelectedLanguage(lang: String) {
        guard let langPath = Bundle.main.path(forResource: lang, ofType: "lproj") else {
            appbundle = Bundle.main
            return
        }
        appbundle = Bundle(path: langPath)!
    }
    
    func stringForKey(key: String) -> String {
        return appbundle.localizedString(forKey: key, value: "", table: nil)
    }
}

//let defaultLocalizer = TTLocalizeUtils.defaultLocalizer
