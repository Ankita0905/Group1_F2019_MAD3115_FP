//
//  JsonParsing.swift
//  Group1_F2019_MAD115_FP
//
//  Created by Ankita Jain on 2019-11-15.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import Foundation
public class JsonParsing {
    
    
    enum empType : String{
        case Intern
        case FullTime
        case PartTime_Fixed_Amount
        case PartTime_Commissioned
    }
    var total:Float=0.0
    //var empDict = Dictionary<String,Employee>()
    func dataparsing() {
        
        let url = Bundle.main.url(forResource: "DataofEmp", withExtension: "json")!
        
        do {
            guard let jsonData = try? Data(contentsOf: url) else {
                return
            }

            guard (try? JSONSerialization.jsonObject(with: jsonData, options: [])) != nil else {
                return
            }

            
            do {
                
                let decoder = JSONDecoder()
                
                
            
                let model = try decoder.decode(Pojo.Welcome.self, from: jsonData)

                
                
                for i in 0..<model.jsondata.count{
                    
                    if("Intern" == model.jsondata[i].type)
                    {
                        let iObj = Intern(IempID: model.jsondata[i].id, IName: model.jsondata[i].name, IAge: model.jsondata[i].age, IEarning: 1000.0, SchoolName: model.jsondata[i].schoolName!, IEmpType: model.jsondata[i].type, Vobj: model.jsondata[i].vehicle)
                        
                        iObj.printMyData()
                       total+=iObj.calEarnings()
                    }
                    else if ("FullTime" == model.jsondata[i].type)
                    {
                        let fObj = FullTime(FTEmpID: model.jsondata[i].id, FTEmptype: model.jsondata[i].type, FTEmpName: model.jsondata[i].name, FTEmpAge: model.jsondata[i].age, Salary: model.jsondata[i].salary!, Bonus: model.jsondata[i].bonus!, Vobj: model.jsondata[i].vehicle)
                        
                        fObj.printMyData()
                    total+=fObj.calEarnings()
                    }
                    else if("PartTime_Fixed_Amount" == model.jsondata[i].type)
                    {
                        let fPtObj = FixedBasedPartTime(FixTEmpID: model.jsondata[i].id, FixTEmptype: model.jsondata[i].type, FixTEmpName: model.jsondata[i].name, FixTEmpAge: model.jsondata[i].age, Rate: model.jsondata[i].rate!, HoursWorked: model.jsondata[i].hoursWorked!, FixedAmount: model.jsondata[i].fixedAmount!, Vobj: model.jsondata[i].vehicle)
                        
                        fPtObj.printMyData()
                      total+=fPtObj.calEarnings()
                    }
                    else if("PartTime_Commissioned" == model.jsondata[i].type)
                    {
                        let cPtObj = CommissionBasedPartTime(ComTEmpID: model.jsondata[i].id, ComTEmptype: model.jsondata[i].type, ComTEmpName: model.jsondata[i].name, ComTEmpAge: model.jsondata[i].age, Rate: model.jsondata[i].rate!, HoursWorked: model.jsondata[i].hoursWorked!, CommissionPer: model.jsondata[i].commissionPercent!, Vobj: model.jsondata[i].vehicle)
                        
                        cPtObj.printMyData()
                      total+=cPtObj.calEarnings()
                    }
                   
                   // empDict.updateValue( <#Employee#>, forKey: <#T##String#>)
                }
                print("------------------------------------")
                                   print("Total Payroll : \(total)")
                                    print("------------------------------------")
              
            } catch let parsingError {
                print("Error While Parsing", parsingError)
            }
            
        }
        let obj = JsonParsing()
           obj.dataparsing()
    }
   
}



