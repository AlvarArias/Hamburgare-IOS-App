//
//  Petition.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-17.
//

import Foundation
/*
 test
struct Petition: Codable {
    var name: String
    var description: String
    var image: String
}
*/


struct Petition: Codable {
    
    var id: String
    var name: String
    var description: String
    var image: String
    var portions: String
    var ingredients: String
    var preparation: String
    var calories: String
    var fett: String
    var salt: String
    var kolhydrater: String
    var protein: String
    var time: String
    
}
