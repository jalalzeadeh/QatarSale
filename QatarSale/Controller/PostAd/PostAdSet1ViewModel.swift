//
//  PostAdSet1ViewModel.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation

class PostAdSetp1ViewModel {
    var isNextAvaliable = false
    var categoryIdSelected = -1
    var catsList = [
    Category(id: 1, name: "Airplane"),
    Category(id: 2, name: "Men’s Clothing"),
    Category(id: 3, name: "Phones & Accessories"),
    Category(id: 4, name: "Womens's Clothing")]
    
    var SectionsList: [Section] = []
    var favorites: [Favorite] = []
    
    init (){
        
        SectionsList = [
            Section(id: 1, name: "Phone Call Tablets", cats: catsList),
            Section(id: 1, name: "Phone Call Tablets", cats: catsList),
            Section(id: 1, name: "Phone Call Tablets", cats: catsList),
            Section(id: 1, name: "Phone Call Tablets", cats: catsList),
            Section(id: 1, name: "Phone Call Tablets", cats: catsList)]
        
        favorites = [Favorite(id: 1, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp1") ),
                     Favorite(id: 2, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp2") ),
                     Favorite(id: 3, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp3") ),
                     Favorite(id: 4, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp1") ),
                     Favorite(id: 5, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp2") ),
                     Favorite(id: 6, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp3") ),
                     Favorite(id: 7, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp1") ),
                     Favorite(id: 8, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp2") ),
                     Favorite(id: 9, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp3") ),
                     Favorite(id: 10, name: "Phone Cal Tablets", img: #imageLiteral(resourceName: "favorite_temp1") )]
    }
        
    
    
    
    
    
    
    
    
}
