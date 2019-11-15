//
//  Customer.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import Foundation
class Customer
{
    var customerId : Int?
    var customer_F_Name: String?
    var customer_L_Name : String?
    var full_Name : String{
        return customer_F_Name! + " " + customer_L_Name!
    }
    var customer_Email: String?
    var billDictionary = [Int:Bill]()
    
    var totalBillAmout: Float
    {
        var TotalAmount: Float = 0.0
        
        for bill in billDictionary
        {
            TotalAmount = TotalAmount + bill.value.totalBillAmount
        }
        return TotalAmount
    }
    func addBill(Bill: Bill) {
        billDictionary.updateValue(Bill, forKey: Bill.Id)
    }
    
    init()
    {
        self.customerId = Int()
        self.customer_F_Name = String()
        self.customer_L_Name = String()
        self.customer_Email = String()
    }
    
    
    
    init(customerId:Int,customerFirstName: String,customerLastName:String,customerEmail:String) {
        self.customerId=customerId
        self.customer_F_Name=customerFirstName
        self.customer_L_Name=customerLastName
        self.customer_Email=customerEmail
    }
}
