//
//  Localizer.swift
//  TenTime
//
//  Created by Yousef on 2/27/19.
//  Copyright © 2019 Jhonny. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift


class Localizer {
    
    class func changeLanguage() {
        exchangeMethodeForClass(className: UIApplication.self,
                                origialSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection)
            , overrideSelecotr: #selector(getter: UIApplication.Custome_userIntfaceLayoutDirection))
    }
    class func leftDirection() {
        exchangeMethodeForClass(className: UIApplication.self ,
                                origialSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection)
            , overrideSelecotr: #selector(getter: UIApplication.Custome_userIntfaceLeftLayoutDirection))
    }
}

extension UIApplication {
    @objc var Custome_userIntfaceLayoutDirection : UIUserInterfaceLayoutDirection {
        get {
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            if RTL_LANGUAGES.contains(Localize.currentLanguage()){
                direction = UIUserInterfaceLayoutDirection.rightToLeft
            }
            
            return direction
        }
    }
    
    @objc var Custome_userIntfaceLeftLayoutDirection: UIUserInterfaceLayoutDirection {
        get {
            let direction = UIUserInterfaceLayoutDirection.leftToRight
            return direction
        }
    }
    
}

func exchangeMethodeForClass(className : AnyClass , origialSelector : Selector , overrideSelecotr : Selector ) {
    let originalMethod : Method = class_getInstanceMethod(className, origialSelector)!
    let overridMethod : Method = class_getInstanceMethod(className, overrideSelecotr)!
    if  class_addMethod(className, origialSelector ,  method_getImplementation(overridMethod), method_getTypeEncoding(overridMethod)) {
        class_replaceMethod(className, overrideSelecotr , method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    }
    else {
        method_exchangeImplementations(originalMethod, overridMethod)
    }
}
