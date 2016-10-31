//
//  Recipe.swift
//  Cooking
//
//  Created by Johan Vallejo on 25/10/16.
//  Copyright © 2016 kijho. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredient: [String]!
    var step: [String]!
    //var isFavourite: Bool = false
    var rating : String = "rating"
    
    init(name: String, image: UIImage, time: Int, ingredient: [String], step: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredient = ingredient
        self.step = step
    }
    
}
