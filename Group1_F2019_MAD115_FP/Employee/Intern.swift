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
    
    
   
    
    init(IempID:Int,IName:String,ISchoolName:String,IEmpType: String,IDOB : Date)
    {
        print(ISchoolName)
        self.schoolName=ISchoolName
        print("welcome\(schoolName)")
        super.init(EmpID: IempID, EmpName: IName, EmpDOB: IDOB,  EmpType: IEmpType)
        
    }
    
   
    override init() {
        self.schoolName=String()
        super.init()
    }
   
   
   
    
}
