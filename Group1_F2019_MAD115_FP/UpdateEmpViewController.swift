//
//  UpdateEmpViewController.swift
//  Group1_F2019_MAD115_FP
//
//  Created by Sandeep Jangra on 2019-11-17.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit

class UpdateEmpViewController: UIViewController {
    
    
    var UemployeeDetails:Employee?=nil
    var UemployeeInternDetails:Intern?=nil
    var UemployeeFullTimeDetails:FullTime?=nil
    var UemployeeCommissionDetails:CommissionBasedPartTime?=nil
    var UemployeeFixedDetails:FixedBasedPartTime?=nil
    
    
let sinIns = Singleton.getInstance()
    @IBOutlet weak var txtUpdateFName: UITextField!
    @IBOutlet weak var txtUpdateEmail: UITextField!
    @IBOutlet weak var txtUpdateDOB: UITextField!
    @IBOutlet weak var segUpdateEmpType: UISegmentedControl!
    @IBOutlet weak var txtUpdateSchoolName: UITextField!
    @IBOutlet weak var txtUpdateSalary: UITextField!
    @IBOutlet weak var txtUpdateBonus: UITextField!
    @IBOutlet weak var segUpdatePartTimeType: UISegmentedControl!
    @IBOutlet weak var txtUpdateRate: UITextField!
    @IBOutlet weak var txtUpdateHrsWorked: UITextField!
    @IBOutlet weak var txtUpdateCommission: UITextField!
    @IBOutlet weak var txtUpdateAmount: UITextField!
    @IBOutlet weak var updateInterView: UIView!
    @IBOutlet weak var updateFullTimeView: UIView!
    @IBOutlet weak var updatePartTimeView: UIView!
    @IBOutlet weak var updateCommissionView: UIView!
    @IBOutlet weak var updateFixedView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveCustomerButton()
        
        
        updateFields()
        
        
        
        
               self.showDatePicker()
             
               self.txtUpdateDOB.resignFirstResponder()
               updateFullTimeView.isHidden=true
               updateInterView.isHidden=false
               updatePartTimeView.isHidden=true
               updateCommissionView.isHidden=false
               updateFixedView.isHidden=true
       
    }
    
    
    
    
    func updateFields()
    {
        if UemployeeDetails?.empType=="Intern"
            
        {
            txtUpdateEmail.text=UemployeeDetails?.empEmail
        txtUpdateFName.text=UemployeeDetails?.name
       
            txtUpdateDOB.text="\(String(describing: UemployeeDetails!.DOB.getForamttedDate()))"
        txtUpdateSchoolName.text=UemployeeInternDetails?.schoolName
        }
    }
    
    
    
    
    
    
    
    let datePicker = UIDatePicker()
                 
                 
                 
                 func showDatePicker(){
                       
                        datePicker.datePickerMode = .date
                        let toolbar = UIToolbar();
                        toolbar.sizeToFit()
                        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
                        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
                        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
                        txtUpdateDOB.inputAccessoryView = toolbar
                        txtUpdateDOB.inputView = datePicker
                        
                    }
                    
             @objc func donedatePicker(){
                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd/MM/yyyy"
                     txtUpdateDOB.text = formatter.string(from: datePicker.date)
                        self.view.endEditing(true)
             //           let formatter = DateFormatter()
             //           formatter.dateFormat = "dd/MM/yyyy"
             //           txtDatePicker.text = formatter.string(from: datePicker.date)
             //           self.view.endEditing(true)
                        }
                    
                    @objc func cancelDatePicker(){
                        self.view.endEditing(true)
                    }
    
    
    
    private func saveCustomerButton()
    {
        let saveBtn=UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(AddEmployeeDetailViewController.saveCustomer(sender:)))
    
        navigationItem.rightBarButtonItem=saveBtn
        
    }
    
    
     @objc
        func saveCustomer(sender: UIBarButtonItem)
        {
            
            let savebutton=UIStoryboard(name: "Main", bundle: nil)
            let customerListVC=savebutton.instantiateViewController(withIdentifier: "CustomerListVC") as! EmployeeListViewController
            
            
            
            
            let first_Name = txtUpdateFName.text
            let full_name=first_Name!
            let salary=(txtUpdateSalary.text! as NSString).floatValue
            let bonus=(txtUpdateBonus.text! as NSString).floatValue
            let rate=(txtUpdateRate.text! as NSString).floatValue
            let hrsWorked=(txtUpdateHrsWorked.text! as NSString).floatValue
            let commissionPer=(txtUpdateCommission.text! as NSString).floatValue
            let fixedAmount=(txtUpdateAmount.text! as NSString).floatValue
            
            
            
          
            
            
            
            func isValidEmail() -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                
                let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailPred.evaluate(with: txtUpdateEmail.text!)
            }
            
            
            if isValidEmail()
            {
                
                let email = txtUpdateEmail.text
                if segUpdateEmpType.selectedSegmentIndex == 0{
                    sinIns.updateInternEmployee(EID: UemployeeDetails!.empID, EName: full_name, EDOB:datePicker.date, EType: "Intern", Ischool: txtUpdateSchoolName.text!, EEmail: txtUpdateEmail.text!)
                   
                }
                
                else if segUpdateEmpType.selectedSegmentIndex == 1{
                    sinIns.addFullTimeEmployee(FTID: 1, FTtype: "FullTime", FTEName: full_name, FTDob: datePicker.date, FTSalary: salary, FTBonus: bonus, EEmail: txtUpdateEmail.text!)
                }
                else if segUpdateEmpType.selectedSegmentIndex==2{
                    if segUpdatePartTimeType.selectedSegmentIndex==0
                    {
                        sinIns.addCommissionEmployee(ComTID: 1, ComTtype: "CommissionBasedPT", ComTName: full_name, ComDob: datePicker.date, Rate: rate, HoursWorked: hrsWorked, CommissionPer: commissionPer, EEmail: txtUpdateEmail.text!)
                    }
                    else if segUpdatePartTimeType.selectedSegmentIndex==1
                    {
                        sinIns.addFixedEmployee(FixID: 1, Fixtype: "FixedBasedPT", FixName: full_name, FixDob: datePicker.date, Rate: rate, HoursWorked: hrsWorked, FixedAmount: fixedAmount, EEmail: txtUpdateEmail.text!)
                    }
                }
                
                let alert = UIAlertController(title: "Employee Details Updated ", message: "Congrats!", preferredStyle: .alert)
               
                let clvc = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                let updateDetailVC=clvc.instantiateViewController(withIdentifier: "CustomerListVC")
                
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert:UIAlertAction!) in
                    
                  self.navigationController?.popViewController(animated: true)
                   // self.navigationController!.pushViewController(updateDetailVC, animated: true)
                    
                }))
                self.present(alert, animated: true)
            }
            else{
                let alert = UIAlertController(title: "Invalid Email Entered!", message: "Please Enter a Valid Email Address", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                
            }
        }
    
    @IBAction func updateTypeSeg(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
          case 0:
              updateInterView.isHidden = false
              updateFullTimeView.isHidden=true
              updatePartTimeView.isHidden=true
          case 1:
              updateFullTimeView.isHidden = false
              updateInterView.isHidden=true
              updatePartTimeView.isHidden=true
          case 2:
              updatePartTimeView.isHidden=false
              updateFullTimeView.isHidden=true
              updateInterView.isHidden = true
              
        
          default:
              print("")
          }
    }
    
    @IBAction func updatePartTimeSeg(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
              case 0:
                  updateCommissionView.isHidden=false
                  updateFixedView.isHidden=true
              case 1:
                  updateFixedView.isHidden=false
                  updateCommissionView.isHidden=true
             
              default:
                  print("")
          
              }
    }
}
