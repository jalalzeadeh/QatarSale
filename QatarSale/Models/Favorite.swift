//
//  Favorite.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
import SwiftyJSON

class Favorite {
    var id: Int?
    var name: String?
    var image = UIImage()
    
    private let keyId = "ID"
    private let keyName = "Title"

    init() {
    }
    
    init(id: Int, name: String, img: UIImage) {
        self.id = id
        self.name = name
        self.image = img
    }
    
    init(json: JSON) {
        self.id = json[keyId].int
        self.name = json[keyName].string
    }

    
}

