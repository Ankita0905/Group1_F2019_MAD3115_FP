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

  
    init(PTEmpID: Int,PTEmptype: String, PTEmpName:String,PTEmpAge:Int,Rate:Float,HoursWorked:Float,Vobj:Pojo.Vehicle)
    {
        self.rate=Rate
        self.hoursworked=HoursWorked
        super.init(EmpID: PTEmpID,EmpName:PTEmpName, EmpAge:PTEmpAge, EmpType: PTEmptype, Vobj: Vobj)
    }
    
    
    override func printMyData() {
       // print(" Employee Is \(empType)")
        super.printMyData()
        print(" Rate :\(rate)\n","Hours Worked :\(hoursworked.hours())")
    }
    
    
    
    
}
