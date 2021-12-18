//
//  PostAdStep3ViewModel.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
enum TypeSelect: String {
    case market
    case auction
}

class PostAdStep3ViewModel {
    var isNextAvaliable = false
    var selectrdType = TypeSelect.market
    
    let durations = [1,2,3,4,5,6,7,8]
    var selectedDuration = -1
    
}
