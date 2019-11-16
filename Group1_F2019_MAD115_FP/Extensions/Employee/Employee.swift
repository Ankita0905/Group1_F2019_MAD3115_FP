//
//  Employee.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Employee:IPrintable
    {
    var empID : Int
    var name: String
    var age: Int
    //var earning: Float
//    {
//        get {
//            return self.earning
//        }
//    }
    var empType : String
    var yearofBirth : Int
    
    {
        get {
                    let date = Date()
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.year], from: date)
                    let year = components.year!
                    return year-age
        }
    }
    var vobj : Pojo.Vehicle
    
    init(EmpID : Int,EmpName:String,EmpAge:Int,EmpType: String,Vobj: Pojo.Vehicle)
    {
        empID=EmpID
        name = EmpName
        age = EmpAge
        empType=EmpType
        vobj=Vobj
    
    }
    
    func printMyData() {
        
        print("---------------------------------------------------------")
        print(" Emp ID :\(empID)")
        print("Name :\(name)\n")
        print("Year Of Birth :\(yearofBirth)")
        if vobj.type==""{
            print("Employee has No vehicle")
        }
        else{
            print("Employee has a  : \(vobj.type)")
            print("  -   Make : \(vobj.make)")
            print("  -   Year : \(vobj.year)")
            print("  -   Plate : \(vobj.plate)")
            print("Employee is a  : \(empType)")

        }
    }
    
    // created By Anikta and Karan
    //https://www.zerotoappstore.com/get-year-month-day-from-date-swift.html
//    func calBirthYear() -> Int {
//        let date = Date()
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year], from: date)
//        let year = components.year!
//        return year-age
//
//
//    }
    
    func calEarnings()->Float
    {
        return 1000
    }
    
    
}
