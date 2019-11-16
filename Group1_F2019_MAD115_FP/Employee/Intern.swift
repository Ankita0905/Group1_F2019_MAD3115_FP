//
//  Intern.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Intern:Employee
{
  
    
   
    var schoolName:String
    
    
    override init()
       {
           self.schoolName=String()
        super.init()
       }
    
    init(IempID:Int,IName:String,SchoolName:String,IEmpType: String,IDOB : Date)
    {
        self.schoolName=SchoolName
        super.init(EmpID: IempID, EmpName: IName, EmpDOB: IDOB,  EmpType: IEmpType)
        
    }
    
   
    
   
   
   
    
}
