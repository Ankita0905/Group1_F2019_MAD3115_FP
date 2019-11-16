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
    private var employeeDictionary  = [Int:Employee]()
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
               let emp = employeeDictionary.count+1
            let temp = Intern(IempID: emp, IName: EName, SchoolName: Ischool, IEmpType: EType, IDOB: EDOB)
                self.addIemployee(Iemployee: temp)

           }

    func addIemployee(Iemployee: Intern)
    {
        employeeDictionary.updateValue(Iemployee, forKey: Iemployee.empID)
    }


        
        
        func returnEmployeeObj(empID : Int) -> Employee?
        {
            for (k,v) in employeeDictionary
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
            return employeeDictionary.count
        }
        
        
       
       

        
      
       
      
        
        
 

    
}
