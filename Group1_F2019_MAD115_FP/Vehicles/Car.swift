//
//  Car.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Car : Vehicle
{
    var noOfDoors = Int()
    var model = String()
    var yMake = String()
    
    
    
    init(noOfDoors : Int,Make  : String, plate : String ,model : String, year : String) {
        super.init(make: Make, plate: plate)
        self.model = model
        self.yMake = year
        self.noOfDoors = noOfDoors
        self.type="Car"
        }
    

}
