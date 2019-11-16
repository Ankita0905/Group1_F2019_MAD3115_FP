//
//  FixedBasedPartTime.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class FixedBasedPartTime:PartTime
{
    var fixedAmount:Float
    
    init(FixTEmpID: Int, FixTEmptype: String, FixTEmpName: String, FixTEmpAge: Date,  Rate: Float, HoursWorked: Float,FixedAmount:Float) {
        self.fixedAmount=FixedAmount
        super.init(PTEmpID: FixTEmpID, PTEmptype: FixTEmptype, PTEmpName: FixTEmpName, PTEmpAge: FixTEmpAge, Rate: Rate, HoursWorked: HoursWorked)
    }
    
    override func calEarnings()->Float {
        return rate * hoursworked + fixedAmount
        
    }
   
}
