//
//  ShowEmployeeDetailsViewController.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class ShowEmployeeDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let i=Singleton.getInstance()
    var employeeDetails:Employee?=nil
    var employeeInternDetails:Intern?=nil
    var employeeFullTimeDetails:FullTime?=nil
    var employeeCommissionDetails:CommissionBasedPartTime?=nil
    var employeeFixedDetails:FixedBasedPartTime?=nil
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var idView: UILabel!
    @IBOutlet weak var firstNameView: UILabel!
    @IBOutlet weak var totalAmountView: UILabel!
    @IBOutlet weak var lastNameView: UILabel!
    @IBOutlet weak var emailView: UILabel!
    @IBOutlet weak var billListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Intern employee
        if employeeDetails?.empType=="Intern"
        {
            idView.text="Employee ID :\(String(describing: employeeInternDetails!.empID))\nEmployee Name : \(String(describing: employeeInternDetails!.name))\nEmployee Email:\(employeeInternDetails!.empEmail)\nEmployee DOB : \(String(describing: employeeInternDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeInternDetails!.empType)  \nSchool Name : \(String(describing: employeeInternDetails!.schoolName))\nTotal Pay Amount : \(String(describing: employeeInternDetails!.calEarnings().currencyFormat()))"
            

        }
        else if employeeDetails?.empType=="FullTime"
        {
        //Full Time Employee
            idView.text="Employee ID :\(String(describing: employeeFullTimeDetails!.empID))\nEmployee Name : \(String(describing: employeeFullTimeDetails!.name))\nEmployee Email:\(employeeFullTimeDetails!.empEmail)\nEmployee DOB : \(String(describing: employeeFullTimeDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeFullTimeDetails!.empType)\nSalary : \(String(describing: employeeFullTimeDetails!.salary))  \nBonus : \(String(describing: employeeFullTimeDetails!.bonus))\nTotal Pay Amount : \(String(describing: employeeFullTimeDetails!.calEarnings().currencyFormat()))"
            

        }
        else if employeeDetails?.empType=="CommissionBasedPT"
        {
        //CommissionBased Employee
            idView.text="Employee ID :\(String(describing: employeeCommissionDetails!.empID))\nEmployee Name : \(String(describing: employeeCommissionDetails!.name))\nEmployee Email:\(employeeCommissionDetails!.empEmail)\nEmployee DOB : \(String(describing: employeeCommissionDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeCommissionDetails!.empType)\nRate : \(String(describing: employeeCommissionDetails!.rate))\nHours Worked : \(String(describing: employeeCommissionDetails!.hoursworked))\nCommission % : \(String(describing: employeeCommissionDetails!.commissionPer))\nTotal Pay Amount : \(String(describing: employeeCommissionDetails!.calEarnings().currencyFormat()))"

            

        }
        
        else if employeeDetails?.empType=="FixedBasedPT"
        {
        
            //FixedBased Employee
            
            idView.text="Employee ID :\(String(describing: employeeFixedDetails!.empID))\nEmployee Name : \(String(describing: employeeFixedDetails!.name))\nEmployee Email:\(employeeFixedDetails!.empEmail)\nEmployee DOB : \(String(describing: employeeFixedDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeFixedDetails!.empType)\nRate : \(String(describing: employeeFixedDetails!.rate))\nHours worked : \(String(describing: employeeFixedDetails!.hoursworked))\nFixed Amount : \(String(describing: employeeFixedDetails!.fixedAmount))\nTotal Pay Amount : \(String(describing: employeeFixedDetails!.calEarnings().currencyFormat()))"
                    }
        
        updateEmp()
        self.billListTable.delegate=self
        self.billListTable.dataSource=self
        
        
    }
    let updateEmployee = UIBarButtonItem()
    
    private func updateEmp()
    {

        let btnUpdate=UIBarButtonItem(title: "Update Emp", style: .done, target: self, action: #selector(ShowEmployeeDetailsViewController.update(sender:)))
        navigationItem.rightBarButtonItem=btnUpdate


    }

    @objc func update(sender: UIBarButtonItem){
        let clvc = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let updateDetailVC=clvc.instantiateViewController(withIdentifier: "updateVC") as! UpdateEmpViewController
        
        
        updateDetailVC.UemployeeDetails=i.returnEmployeeObj(empID: employeeDetails!.empID)
        if employeeDetails?.empType=="Intern"{
        updateDetailVC.UemployeeInternDetails=i.returnEmployeeObj(empID: employeeInternDetails!.empID) as! Intern
        }
        else if employeeDetails?.empType=="FullTime"{
            updateDetailVC.UemployeeFullTimeDetails=i.returnEmployeeObj(empID: employeeFullTimeDetails!.empID) as! FullTime}
        else if employeeDetails?.empType=="CommissionBasedPT"{
            updateDetailVC.UemployeeCommissionDetails=i.returnEmployeeObj(empID: employeeCommissionDetails!.empID) as! CommissionBasedPartTime}
        else if employeeDetails?.empType=="FixedBasedPT"{
        updateDetailVC.UemployeeFixedDetails=i.returnEmployeeObj(empID: employeeFixedDetails!.empID) as! FixedBasedPartTime
        }
        self.navigationController?.pushViewController(updateDetailVC, animated: true)
        

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (employeeDetails?.returnVehicleArray().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell")!
//        let a = i.returnVehicleObj(Id: Int(indexPath.row+1))
//        print(a!.id)
       // cell.textLabel!.text = (a!.plate)
        let varray=employeeDetails!.returnVehicleArray()
        let veh=varray[indexPath.row]
       var details=""
        var typeveh=veh as! Vehicle
       
      
        if typeveh.type=="Car"
        {
             let typeCar=veh as! Car
        cell.textLabel?.numberOfLines=8
            details="\nEmployee has a : \(typeCar.type)\nMake : \(typeCar.make)\nPlate number : \(typeCar.plate)\nModel : \(typeCar.model)\nNumber of doors : \(typeCar.noOfDoors)\nYear : \(typeCar.yMake)"
        }
        else if typeveh.type=="MotorCycle"
        {
             let typeMotorcycle=veh as! Motorcycle
            cell.textLabel?.numberOfLines=8
            details="\nEmployee has a : \(typeMotorcycle.type)\nMake : \(typeMotorcycle.make)\nPlate number : \(typeMotorcycle.plate)\nModel : \(typeMotorcycle.model)\nYear : \(typeMotorcycle.yMake)"
        }
        else if typeveh.type=="nil"
        {
            details="Employee Has no vehicle"
        }
        cell.textLabel?.text="\(details)"
       return cell
        
//        let currentBill = customerdetails!.billDictionary[indexPath.row + 1]
//    var detail = ""
//        if currentBill?.billType == billTypes.Mobile{
//            cell.textLabel?.numberOfLines = 12
//            let mobileBill = currentBill as! Mobile
//          detail = "\nBill Type : Mobile \nManufacturer Name : \(mobileBill.mobileManufacturer) \nPlan Name : \(mobileBill.planName) \nMobile Number : \(mobileBill.mobileNumber) \nInternet used : \(mobileBill.internetUsed.data()) \nMinutes Used : \(mobileBill.minuteUsed.minutes()) "
//        } else {
//            if currentBill?.billType == billTypes.Hydro{
//                cell.textLabel?.numberOfLines = 12
//                let hydroBill = currentBill as! Hydro
//                detail = "\nBill Type : Hydro \nAgency Name : \(hydroBill.agencyName) \nUnit Consumed : \(hydroBill.unitconsumed.unit())"
//            } else {
//                if currentBill?.billType == billTypes.Internet{
//                    cell.textLabel?.numberOfLines = 12
//                    let internetBill = currentBill as! Internet
//                    detail = "\nBill Type : Internet \nProvider Name : \(internetBill.providerName) \nInternet Used : \(internetBill.internetUsed.data())"
//                }
//            }
//        }
//       cell.textLabel?.text = "Bill ID : \(String(describing: currentBill!.Id)) \nBill Date : \(String(describing: currentBill!.billDate.getForamttedDate())) \nBill Total : \(String(describing: currentBill!.totalBillAmount.currency())) \(detail)"
        //cell.textLabel?.text="\(details)"
        
    }

    override func viewWillAppear(_ animated: Bool) {
        billListTable.reloadData()
    }
    

}
