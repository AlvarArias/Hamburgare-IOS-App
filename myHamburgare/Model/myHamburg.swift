//
//  myHamburg.swift
//  myHamburgare
//
//  Created by Al@objc dynamic var Arias on 2021-12-29.
//

import Foundation
import RealmSwift

class myHamburg : Object {
    
    @objc dynamic var myid: String?
    @objc dynamic var myname: String?
    @objc dynamic var mydescription: String?
    
    /*
    @objc dynamic var myimage: String?
    @objc dynamic var myportions: String?
    @objc dynamic var myingredients: String?
    @objc dynamic var mypreparation: String?
    @objc dynamic var mycalories: String?
    @objc dynamic var myfett: String?
    @objc dynamic var mysalt: String?
    @objc dynamic var mykolhydrater: String?
    @objc dynamic var myprotein: String?
    @objc dynamic var mytime: String?
    */
    
}

class theHamburg : Object {

    @objc dynamic var myName: String?
    @objc dynamic var myDescription: String?
    @objc dynamic var myImage: String?
    @objc dynamic var myIngredients: String?
    @objc dynamic var myPreparation: String?
    @objc dynamic var myCalories: String?
    @objc dynamic var myTime: String?
    
}

