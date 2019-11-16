//
//  PartTime.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class PartTime:Employee
{
    var rate:Float
    var hoursworked:Float

  
    init(PTEmpID: Int,PTEmptype: String, PTEmpName:String,PTEmpAge:Date,Rate:Float,HoursWorked:Float)
    {
        self.rate=Rate
        self.hoursworked=HoursWorked
        super.init(EmpID: PTEmpID,EmpName:PTEmpName, EmpDOB:PTEmpAge, EmpType: PTEmptype)
   }
    
    
  
    
    
    
    
}
