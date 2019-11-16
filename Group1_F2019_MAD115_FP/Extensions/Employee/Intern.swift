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
    
    init(IempID:Int,IName:String,IAge:Int,IEarning:Float,SchoolName:String,IEmpType: String,Vobj: Pojo.Vehicle)
    {
        self.schoolName=SchoolName
        super.init(EmpID: IempID, EmpName: IName, EmpAge: IAge,  EmpType: IEmpType, Vobj: Vobj)
        //super.init(Emptype : IEmpType,EmpName: IName, EmpAge: IAge, EmpEarning: IEarning)
    }
    
    override func printMyData()
    {
       
        super.printMyData()
        print(" School :\(schoolName)\n")
        print("Total Earnings : \(calEarnings().currencyFormat())")
    }
   
   
    
}
