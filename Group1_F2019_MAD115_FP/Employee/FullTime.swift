//
//  FullTime.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class FullTime:Employee
{
    var salary:Float
    var bonus:Float
    
    
//    init(FTEmpID: Int,FTEmptype: String, FTEmpName:String,FTEmpAge:Int,Salary:Float,Bonus:Float)
//    {
//        self.salary=Salary
//        self.bonus=Bonus
//        super.init(EmpID: FTEmpID,EmpName:FTEmpName, EmpDOB:FTEmpAge,  EmpType: FTEmptype)
//    }
    
    
  
    
    override func calEarnings()->Float
    {
   return salary+bonus
        
        
    }
    
    
    
}
