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
    var empEmail :String
    var employeeDictionary  = [Int:Employee]()
    var vdict = Dictionary<Int, Vehicle>()
    var t1 : Array<Vehicle> = []
    init(EmpID : Int,EmpName:String,EmpDOB: Date,EmpType: String,EmpEmail: String)
    {
        empID=EmpID
        name = EmpName
        empType=EmpType
        DOB=EmpDOB
        empEmail=EmpEmail
    
    }
    init()
    {
        self.empID=Int()
        self.name=String()
        self.DOB=Date()
        self.empType=String()
        self.empEmail=String()
    }
    
   
    
    func calEarnings()->Float
    {
        return 1000
    }
    
    
   
    func addVehicle(v:Vehicle) {
        vdict.updateValue(v, forKey: v.id)
//        print(vdict.keys)
//        print(vdict.values)
    }
    func removevehicle(id:Int)
    {
        vdict.removeValue(forKey: id)
    }
    
    func returnVehicleArray() -> Array<Vehicle>
     {
         var t : Array<Vehicle> = []
         
         for i in vdict.values
         {
             t.append(i)
         }
        t1=t
         return t1
     }
}
