//
//  ShowEmployeeDetailsViewController.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class ShowEmployeeDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var employeeDetails:Employee?=nil
    var employeeInternDetails:Intern?=nil
    var employeeFullTimeDetails:FullTime?=nil
    var employeeCommissionDetails:CommissionBasedPartTime?=nil
    var employeeFixedDetails:FixedBasedPartTime?=nil
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
            idView.text="Employee ID :\(String(describing: employeeInternDetails!.empID))\nEmployee Name : \(String(describing: employeeInternDetails!.name))\nEmployee DOB : \(String(describing: employeeInternDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeInternDetails!.empType)  \nSchool Name : \(String(describing: employeeInternDetails!.schoolName))\nTotal Pay Amount : \(String(describing: employeeInternDetails!.calEarnings().currencyFormat()))"
            
//        idView.text="\(String(describing: employeeInternDetails!.empID))"
//        firstNameView.text=employeeInternDetails?.name
//        lastNameView.text=employeeInternDetails?.name
//        //print(employeeInternDetails?.schoolName)
//        emailView.text=employeeInternDetails?.schoolName
//            totalAmountView.text="\(String(describing: employeeInternDetails!.calEarnings().currencyFormat()))"
        }
        else if employeeDetails?.empType=="FullTime"
        {
        //Full Time Employee
            idView.text="Employee ID :\(String(describing: employeeFullTimeDetails!.empID))\nEmployee Name : \(String(describing: employeeFullTimeDetails!.name))\nEmployee DOB : \(String(describing: employeeFullTimeDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeFullTimeDetails!.empType)\nSalary : \(String(describing: employeeFullTimeDetails!.salary))  \nBonus : \(String(describing: employeeFullTimeDetails!.bonus))\nTotal Pay Amount : \(String(describing: employeeFullTimeDetails!.calEarnings().currencyFormat()))"
            
//               idView.text="\(String(describing: employeeFullTimeDetails!.empID))"
//               firstNameView.text=employeeFullTimeDetails?.name
//               lastNameView.text=employeeFullTimeDetails?.name
//               emailView.text=("\(String(describing: employeeFullTimeDetails!.bonus))")
//            totalAmountView.text=("\(String(describing: employeeFullTimeDetails!.calEarnings().currencyFormat()))")
        }
        else if employeeDetails?.empType=="CommissionBased"
        {
        //CommissionBased Employee
            idView.text="Employee ID :\(String(describing: employeeCommissionDetails!.empID))\nEmployee Name : \(String(describing: employeeCommissionDetails!.name))\nEmployee DOB : \(String(describing: employeeCommissionDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeCommissionDetails!.empType)\nHours Worked : \(String(describing: employeeCommissionDetails!.calHours()))  \nCommission % : \(String(describing: employeeCommissionDetails!.commissionPer))\nTotal Pay Amount : \(String(describing: employeeCommissionDetails!.calEarnings().currencyFormat()))"

            
//            idView.text="\(String(describing: employeeCommissionDetails!.empID))"
//            firstNameView.text=employeeCommissionDetails?.name
//            lastNameView.text=employeeCommissionDetails?.name
//            emailView.text=("\(String(describing: employeeCommissionDetails!.commissionPer))")
//            totalAmountView.text=("\(String(describing: employeeCommissionDetails!.calEarnings().currencyFormat()))")
        }
        
        else if employeeDetails?.empType=="FixedBased"
        {
        
            //FixedBased Employee
            
            idView.text="Employee ID :\(String(describing: employeeFixedDetails!.empID))\nEmployee Name : \(String(describing: employeeFixedDetails!.name))\nEmployee DOB : \(String(describing: employeeFixedDetails!.DOB.getForamttedDate()))\nEmployee Type : \(employeeFixedDetails!.empType)\nFixed Amount : \(String(describing: employeeFixedDetails!.fixedAmount))\nTotal Pay Amount : \(String(describing: employeeFixedDetails!.calEarnings().currencyFormat()))"

            
            
            
//            idView.text="\(String(describing: employeeFixedDetails!.empID))"
//            firstNameView.text=employeeFixedDetails?.name
//            lastNameView.text=employeeFixedDetails?.name
//            emailView.text=("\(String(describing: employeeFixedDetails!.fixedAmount))")
//            totalAmountView.text=("\(String(describing: employeeFixedDetails!.calEarnings().currencyFormat()))")
        }
        
        
        
        
        addBillButton()
        self.billListTable.delegate=self
        self.billListTable.dataSource=self
        
        
    }
    let addBillBtn = UIBarButtonItem()
    
     
     private func addBillButton()
     {
         let btnAddBill=UIBarButtonItem(title: "Add Bill", style: .done, target: self, action: #selector(ShowEmployeeDetailsViewController.addBill(sender:)))
             navigationItem.rightBarButtonItem=btnAddBill
     }
     
     @objc func addBill(sender: UIBarButtonItem)
     {
         
         let addBillbtn=UIStoryboard(name: "Main", bundle: nil)
         let addBarBtn=addBillbtn.instantiateViewController(withIdentifier: "addBillViewContoller") as! AddNewBillViewController
         navigationController?.pushViewController(addBarBtn, animated: true)
         
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell")!
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
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        billListTable.reloadData()
    }
    

}