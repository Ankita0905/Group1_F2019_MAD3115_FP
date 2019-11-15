//
//  AddCustomerDetailViewController.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class AddCustomerDetailViewController: UIViewController {

    
   
    @IBOutlet weak var fixedtypeView: UIView!
    @IBOutlet weak var commissionView: UIView!
    @IBOutlet weak var partTimeTypeSeg: UISegmentedControl!
    @IBOutlet weak var partTimeTypeView: UIView!
    @IBOutlet weak var fullTimeDataView: UIView!
    @IBOutlet weak var internDataView: UIView!
    @IBOutlet weak var empTypeSeg: UISegmentedControl!
    
    @IBOutlet weak var txtDatePicker: UITextField!
    @IBOutlet weak var firstNameTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var lastNameTxtField: UITextField!
    
     let datePicker = UIDatePicker()
    
    
    
    func showDatePicker(){
          
           datePicker.datePickerMode = .date
           let toolbar = UIToolbar();
           toolbar.sizeToFit()
           let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
           toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
           txtDatePicker.inputAccessoryView = toolbar
           txtDatePicker.inputView = datePicker
           
       }
       
       @objc func donedatePicker(){
           
           let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           txtDatePicker.text = formatter.string(from: datePicker.date)
           self.view.endEditing(true)
       }
       
       @objc func cancelDatePicker(){
           self.view.endEditing(true)
       }
    
    
    
    
    
      
      
    
    
    
    
    
    
    
    
    
    private func saveCustomerButton()
    {
        let saveBtn=UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(AddCustomerDetailViewController.saveCustomer(sender:)))
    
        navigationItem.rightBarButtonItem=saveBtn
        
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailTxtField.text!)
    }
    
    
    @objc
    func saveCustomer(sender: UIBarButtonItem)
    {
        
        let savebutton=UIStoryboard(name: "Main", bundle: nil)
        let customerListVC=savebutton.instantiateViewController(withIdentifier: "CustomerListVC") as! CustomerListViewController
        
        
        
        
        let first_Name = firstNameTxtField.text
        let last_Name = lastNameTxtField.text
        
        if isValidEmail()
        {
            
            let email = emailTxtField.text
            a1.addNewCustomers(FirstName: first_Name!, LastName: last_Name!, Email: email!)
            let alert = UIAlertController(title: "Customer Added", message: "Congrats!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert:UIAlertAction!) in self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alert, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Invalid Email Entered!", message: "Please Enter a Valid Email Address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
    }
    
    
    let a1 = Singleton.getInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        saveCustomerButton()
        self.showDatePicker()
      
        self.txtDatePicker.resignFirstResponder()
        fullTimeDataView.isHidden=true
        internDataView.isHidden=false
        partTimeTypeView.isHidden=true
        commissionView.isHidden=false
        fixedtypeView.isHidden=true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func empTypeActionSeg(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            internDataView.isHidden = false
            fullTimeDataView.isHidden=true
            partTimeTypeView.isHidden=true
        case 1:
            fullTimeDataView.isHidden = false
            internDataView.isHidden=true
            partTimeTypeView.isHidden=true
        case 2:
            partTimeTypeView.isHidden=false
            fullTimeDataView.isHidden=true
            internDataView.isHidden = true
            
      
        default:
            print("")
        }
    }
    
    @IBAction func partTimeTypeActionSeg(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            commissionView.isHidden=false
            fixedtypeView.isHidden=true
        case 1:
            fixedtypeView.isHidden=false
            commissionView.isHidden=true
       
        default:
            print("")
        }
    }
    
}
