//
//  Category.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
import SwiftyJSON

class Category {
    var id: Int?
    var name: String?
    
    private let keyId = "ID"
    private let keyName = "Title"

    init() {
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    init(json: JSON) {
        self.id = json[keyId].int
        self.name = json[keyName].string
    }
}
