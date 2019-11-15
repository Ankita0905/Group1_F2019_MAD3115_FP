//
//  AddNewBillViewController.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController {
    var customerobject = Customer()
    let datePicker = UIDatePicker()
    @IBOutlet weak var txtDatePicker: UITextField!
      @IBOutlet weak var txtBillAmount: UITextField!
      @IBOutlet weak var segmentBillTypeValue: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(   self.saveBill(sender:)))
               self.navigationItem.rightBarButtonItem = rightButton
        self.showDatePicker()
          self.txtDatePicker.resignFirstResponder()
        
    }
    
    
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
      
    
    @objc func saveBill(sender: UIBarButtonItem)
    {
        if segmentBillTypeValue.selectedSegmentIndex==0
        {
            MobilesaveBill()
        }
        if segmentBillTypeValue.selectedSegmentIndex==1
        {
            InternetsaveBill()
        }
        if segmentBillTypeValue.selectedSegmentIndex==2
        {
            HydrosaveBill()
        }
        
    }
    
    
     func MobilesaveBill()
          {
            let dictionarySize = ((customerobject.billDictionary.count))
            let Bid = dictionarySize+1
            let billAdd = Mobile(Id: Bid, billDate: datePicker.date, billType: billTypes.Mobile, totalBillAmount: (self.txtBillAmount?.text! as! NSString).floatValue, mobileManufacturer: "Samsung", planName: "Data + Text", mobileNumber: "9090909090", internetUsed: 3 , minuteUsed: 343)
              let convertBill = billAdd as Bill
            customerobject.billDictionary.updateValue( convertBill, forKey: dictionarySize + 1)
            print(">>>>>>#$@")
              self.navigationController?.popViewController(animated: true)
          }
     func HydrosaveBill()
    {
      let dictionarySize = ((customerobject.billDictionary.count))
      let Bid = dictionarySize+1
        let billAdd = Hydro(Id: Bid, billDate: datePicker.date, billType: billTypes.Hydro, totalBillAmount: (self.txtBillAmount?.text! as! NSString).floatValue, agencyName: "EneryHouse", unitconsumed: 231)
        let convertBill = billAdd as Bill
      customerobject.billDictionary.updateValue( convertBill, forKey: dictionarySize + 1)
        self.navigationController?.popViewController(animated: true)
    }
   func InternetsaveBill()
    {
      let dictionarySize = ((customerobject.billDictionary.count))
      let Bid = dictionarySize+2
        print("Internet")
        let billAdd = Internet(Id: Bid, billDate: datePicker.date, billType: billTypes.Internet, totalBillAmount: 123, providerName: "Bell", internetUsed: 344)
        let convertBill = billAdd as Bill
      customerobject.billDictionary.updateValue( convertBill, forKey: dictionarySize + 1)
        self.navigationController?.popViewController(animated: true)
    }
    
     @IBAction func segmentBillType(_ sender: UISegmentedControl) {
           switch sender.selectedSegmentIndex {
           case 0:
               print("Mobile")
              
           case 1:
               print("Internet")
               
           case 2:
               print("Hydro")
               
           default:
               print("Mobile")
           }
    }
}
