//
//  Section.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
import SwiftyJSON

class Section {
    var id: Int?
    var name: String?
    var categories: [Category] = []
    
    private let keyId = "ID"
    private let keyName = "Title"

    init() {
    }
    
    init(id: Int, name: String, cats: [Category] ) {
        self.id = id
        self.name = name
        self.categories = cats
    }
    
    init(json: JSON) {
        self.id = json[keyId].int
        self.name = json[keyName].string
    }
}
