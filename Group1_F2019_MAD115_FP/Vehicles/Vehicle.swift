//
//  Vehicle.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-22.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
// by Kamal and Sandeep
class Vehicle : IPrintable
{
    
    
    var make : String
    var plate : String
    
    init(make : String , plate : String) {
        self.make = make
        self.plate = plate
        
        
    }
    
    
    
    func printMyData() {
        print("Make of Vehicle :\(make)")
        print("Vehicle : \(plate)")
        
    }
    
}
