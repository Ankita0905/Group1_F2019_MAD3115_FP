//
//  Singleton.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import Foundation
class Singleton : NSObject
{
    
    
    private var dict = Employee()
    
    
  
      private static var object = Singleton()
   
       
        private override init() {
            
        }
        
        internal static func getInstance() -> Singleton
        {
            return object
        }
    
    
    
//    func addEmployee(eid: Int,ename : String ,dob : Date,etype : String) {
//        let tmp = employeeDictionary.count+1
//        let emp=Employee(EmpID: tmp, EmpName: ename, EmpDOB: dob, EmpType: etype)
//
//
//    }
//    func addEmployeeDict(employee: Employee) {
//        employeeDictionary.updateValue(employee, forKey: employee.empID)
//    }
    
    func addInternEmployee(EID : Int,EName:String,EDOB: Date,EType: String,Ischool: String)
           {
            let emp = dict.employeeDictionary.count+1
            let temp = Intern(IempID: emp, IName: EName, ISchoolName: Ischool, IEmpType: EType, IDOB: EDOB)
                self.addIemployee(Iemployee: temp)

           }

    func addIemployee(Iemployee: Intern)
    {
        dict.employeeDictionary.updateValue(Iemployee, forKey: Iemployee.empID)
    }

    func addFullTimeEmployee(FTID: Int,FTtype: String,FTEName:String,FTDob:Date,FTSalary:Float,FTBonus:Float)
    {
        let emp1=dict.employeeDictionary.count+1
        let temp2=FullTime(FTEmpID: emp1, FTEmptype: FTtype, FTEmpName: FTEName, FTDob: FTDob, Salary: FTSalary, Bonus: FTBonus)
        self.addFTemployee(FTEmployee: temp2)
    }

    func addFTemployee(FTEmployee:FullTime)
    {
        dict.employeeDictionary.updateValue(FTEmployee, forKey: FTEmployee.empID)
    }
        
    func addCommissionEmployee(ComTID: Int, ComTtype: String, ComTName: String, ComDob: Date, Rate: Float, HoursWorked: Float,CommissionPer:Float)
    {
        let emp2=dict.employeeDictionary.count+1
        let temp3=CommissionBasedPartTime(ComTEmpID: emp2, ComTEmptype: ComTtype, ComTEmpName: ComTName,ComTDob: ComDob, Rate: Rate, HoursWorked: HoursWorked, CommissionPer: CommissionPer)
        self.addCompEmployee(CompEmployee: temp3)
    }
    
    func addCompEmployee(CompEmployee:CommissionBasedPartTime)
    {
        dict.employeeDictionary.updateValue(CompEmployee, forKey: CompEmployee.empID)
    }
        
        func returnEmployeeObj(empID : Int) -> Employee?
        {
            for (k,v) in dict.employeeDictionary
            {
                if empID == k
                {
                    return v
                }
            }
            return nil
            
        }
        func returnCount() -> Int
        {
            return dict.employeeDictionary.count
        }
        
        
       
       

        
      
       
      
        
        
 

    
}
