//
//  Employee.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Employee
    {
    var empID : Int
    var name: String
    var DOB: Date
    var empType : String
    var employeeDictionary  = [Int:Employee]()
    
    
    
    init(EmpID : Int,EmpName:String,EmpDOB: Date,EmpType: String)
    {
        empID=EmpID
        name = EmpName
        empType=EmpType
        DOB=EmpDOB
    
    }
    init()
    {
        self.empID=Int()
        self.name=String()
        self.DOB=Date()
        self.empType=String()
    }
    
   
    
    func calEarnings()->Float
    {
        return 1000
    }
    
    
}
