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
    
    
    //Functions to add all types of Employees
    
    func addInternEmployee(EID : Int,EName:String,EDOB: Date,EType: String,Ischool: String,EEmail:String)
           {
            let emp = dict.employeeDictionary.count+1
            let temp = Intern(IempID: emp, IName: EName, ISchoolName: Ischool, IEmpType: EType, IDOB: EDOB,IEmail: EEmail)
                self.addIemployee(Iemployee: temp)

           }
    
    func updateInternEmployee(EID : Int,EName:String,EDOB: Date,EType: String,Ischool: String,EEmail:String)
    {
     
        let temp = Intern(IempID: EID, IName: EName, ISchoolName: Ischool, IEmpType: EType, IDOB: EDOB,IEmail:EEmail)
         self.addIemployee(Iemployee: temp)

    }
    func updateFullTimeEmployee(FTID: Int,FTtype: String,FTEName:String,FTDob:Date,FTSalary:Float,FTBonus:Float,EEmail:String)
    {
        
        let temp2=FullTime(FTEmpID: FTID, FTEmptype: FTtype, FTEmpName: FTEName, FTDob: FTDob, FTEmail:EEmail, Salary: FTSalary, Bonus: FTBonus)
        self.addFTemployee(FTEmployee: temp2)
    }
    
    func updateCommissionEmployee(ComTID: Int, ComTtype: String, ComTName: String, ComDob: Date, Rate: Float, HoursWorked: Float,CommissionPer:Float,EEmail:String)
    {
        
        let temp3=CommissionBasedPartTime(ComTEmpID: ComTID, ComTEmptype: ComTtype, ComTEmpName: ComTName, ComTEmail: EEmail,ComTDob: ComDob, Rate: Rate, HoursWorked: HoursWorked, CommissionPer: CommissionPer)
        self.addCompEmployee(CompEmployee: temp3)
    }
   
    func updateFixedEmployee(FixID: Int, Fixtype: String, FixName: String, FixDob: Date, Rate: Float, HoursWorked: Float,FixedAmount:Float,EEmail:String)
    {
        
        let temp4=FixedBasedPartTime(FixTEmpID: FixID, FixTEmptype: Fixtype, FixTEmpName: FixName, FixTDob: FixDob, FixTEmail: EEmail, Rate: Rate, HoursWorked: HoursWorked, FixedAmount: FixedAmount)
        self.addFixEmployee(FixEmployee: temp4)
    }
    
    func addIemployee(Iemployee: Intern)
    {
        dict.employeeDictionary.updateValue(Iemployee, forKey: Iemployee.empID)
    }

    func addFullTimeEmployee(FTID: Int,FTtype: String,FTEName:String,FTDob:Date,FTSalary:Float,FTBonus:Float,EEmail:String)
    {
        let emp1=dict.employeeDictionary.count+1
        let temp2=FullTime(FTEmpID: emp1, FTEmptype: FTtype, FTEmpName: FTEName, FTDob: FTDob, FTEmail:EEmail, Salary: FTSalary, Bonus: FTBonus)
        self.addFTemployee(FTEmployee: temp2)
    }

    func addFTemployee(FTEmployee:FullTime)
    {
        dict.employeeDictionary.updateValue(FTEmployee, forKey: FTEmployee.empID)
    }
        
    func addCommissionEmployee(ComTID: Int, ComTtype: String, ComTName: String, ComDob: Date, Rate: Float, HoursWorked: Float,CommissionPer:Float,EEmail:String)
    {
        let emp2=dict.employeeDictionary.count+1
        let temp3=CommissionBasedPartTime(ComTEmpID: emp2, ComTEmptype: ComTtype, ComTEmpName: ComTName, ComTEmail: EEmail,ComTDob: ComDob, Rate: Rate, HoursWorked: HoursWorked, CommissionPer: CommissionPer)
        self.addCompEmployee(CompEmployee: temp3)
    }
    
    
    
    func addCompEmployee(CompEmployee:CommissionBasedPartTime)
    {
        dict.employeeDictionary.updateValue(CompEmployee, forKey: CompEmployee.empID)
    }
       
    func addFixedEmployee(FixID: Int, Fixtype: String, FixName: String, FixDob: Date, Rate: Float, HoursWorked: Float,FixedAmount:Float,EEmail:String)
    {
        let emp3=dict.employeeDictionary.count+1
        let temp4=FixedBasedPartTime(FixTEmpID: emp3, FixTEmptype: Fixtype, FixTEmpName: FixName, FixTDob: FixDob, FixTEmail: EEmail, Rate: Rate, HoursWorked: HoursWorked, FixedAmount: FixedAmount)
        self.addFixEmployee(FixEmployee: temp4)
    }
    
    func addFixEmployee(FixEmployee:FixedBasedPartTime)
    {
        dict.employeeDictionary.updateValue(FixEmployee, forKey: FixEmployee.empID)
    }
        
    let date=Date()
    
    func AddEmployee(employee: Employee)
    {
        dict.employeeDictionary.updateValue(employee, forKey: employee.empID)
    }
//    func addVehicle(v:Vehicle) {
//        dict.vdict.updateValue(v, forKey: v.plate)
//    
//        }
    
    
    func createEmp()
    {
        let c1=Car(noOfDoors: 4, Make: "Honda", plate: "ABC101", model: "Civic", year: "2009", Cid: 1)
        let c2=Car(noOfDoors: 2, Make: "Ferrari", plate: "KAr123", model: "F1", year: "2018", Cid: 2)
        let i1=Intern(IempID: 1, IName: "Ankita Jain", ISchoolName: "Lambton", IEmpType: "Intern", IDOB: date,IEmail: "ankita@gmail.com")
    
        i1.addVehicle(v: c1)
        i1.addVehicle(v: c2)
         AddEmployee(employee: i1)
        let f1 = FullTime(FTEmpID: 2, FTEmptype: "FullTime", FTEmpName: "Karan Kumar", FTDob: date, FTEmail:"karan@gmail.com", Salary: 933.10, Bonus: 837.2)
        AddEmployee(employee: f1)
        let c3=Car(noOfDoors: 2, Make: "Ferrari", plate: "KAr123", model: "F1", year: "2018", Cid: 1)
       // f1.addVehicle(v: c3)
        let m1=Motorcycle(make: "BMW", plate: "KAR234", model: "RR1000", year: "2019", Mid: 2)
       // f1.addVehicle(v: m1)
        
        let cPt1=CommissionBasedPartTime(ComTEmpID: 3, ComTEmptype: "CommissionBasedPT", ComTEmpName: "Sandeep",ComTEmail: "sandeep@gmail.com", ComTDob: date, Rate: 64.2, HoursWorked: 83.4, CommissionPer: 5)
        AddEmployee(employee: cPt1)
    
        let fbPt1=FixedBasedPartTime(FixTEmpID: 4, FixTEmptype: "FixedBasedPT", FixTEmpName: "Kamal", FixTDob: date, FixTEmail: "kamal@gmail.com", Rate: 46.4, HoursWorked: 64, FixedAmount: 32)
        AddEmployee(employee: fbPt1)
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
        
        
       
    func returnVehicleObj(Id: Int) -> Vehicle?
       {
        for (k,v) in dict.vdict
           {
               if Id == k
               {
                    print(v)
                   return v
               }
           }
           return nil
           
       }

        
      
       func returnVehicleCount() -> Int
              {
               // print(dict.vdict.count)
                return dict.vdict.count
              }
      
        
        
 

    
}
