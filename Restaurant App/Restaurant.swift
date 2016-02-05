//
//  Restaurant.swift
//  Restaurant App
//
//  Created by Kate Simmons on 2/3/16.
//  Copyright © 2016 Kate Simmons. All rights reserved.
//

import Foundation

class Restaurant {
    
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name:String, type:String, location:String, image:String, isVisited:Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}