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
    
    private var customerDictionary  = [Int:Customer]()
    private static var object = Singleton()

    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return object
    }
    
    
    func addNewCustomers(FirstName : String, LastName : String, Email : String)
    {
        let cust = customerDictionary.count+1
        
        let temp = Customer(customerId: cust, customerFirstName: FirstName, customerLastName: LastName, customerEmail: Email)
        self.addCustomer(customer: temp)
    }
    
    func addCustomer(customer: Customer)
    {
        customerDictionary.updateValue(customer, forKey: customer.customerId!)
    }
    
    
    func returnCustomerObj(customerID : Int) -> Customer?
    {
        for (k,v) in customerDictionary
        {
            if customerID == k
            {
                return v
            }
        }
        return nil
        
    }
    func returnCount() -> Int
    {
        return customerDictionary.count
    }
    
    
    func createCustomer()
    {
       
       
        
       
        
       
       
        
        
        
        
       
        let cust1 = Customer(customerId: 1, customerFirstName: "Sandeep", customerLastName: "Singh", customerEmail: "sandeep123@gmail.com ")
         let M1: Mobile = Mobile(Id: 1, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 123.34, mobileManufacturer: "Samsung Note 10+", planName: "BigGig", mobileNumber: "+1234567890", internetUsed: 33, minuteUsed: 45)
        let H1: Hydro = Hydro(Id: 2, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 234.35, agencyName: "Toronto Hydro", unitconsumed: 234)
         let I1 = Internet(Id: 3, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 253.34, providerName: "HomeNet", internetUsed: 232)
        addCustomer(customer: cust1)
        cust1.addBill(Bill: M1)
        cust1.addBill(Bill: H1)
        cust1.addBill(Bill: I1)
        
        
        let cust2 = Customer(customerId: 2, customerFirstName: "Ankita", customerLastName: "Jain", customerEmail: "ankita123@gmail.com ")
        let H2: Hydro = Hydro(Id: 1, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 344, agencyName: "Gta Energy", unitconsumed: 345)
         let M2: Mobile = Mobile(Id: 2, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 535.6, mobileManufacturer: "Apple", planName: "Gig Talk + Net", mobileNumber: "+1234567890", internetUsed: 234, minuteUsed: 657)
         let I2: Internet = Internet(Id: 3, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 456.56, providerName: "DataBoss", internetUsed: 453)
        addCustomer(customer: cust2)
        cust2.addBill(Bill: H2)
        cust2.addBill(Bill: M2)
        cust2.addBill(Bill: I2)
       
        
        
        let cust3 = Customer(customerId: 3, customerFirstName: "Karan", customerLastName: "Kumar", customerEmail: "karan123@gmail.com ")
        addCustomer(customer: cust3)
        
         let H3: Hydro = Hydro(Id: 1, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 344, agencyName: "Gta Energy", unitconsumed: 345)
         let I3: Internet = Internet(Id: 2, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 234.42, providerName: "Jio", internetUsed: 356)
            cust3.addBill(Bill: H3)
            cust3.addBill(Bill: I3)
       
        
        let cust4 = Customer(customerId: 4, customerFirstName: "Kamal", customerLastName: "Kaur", customerEmail: "kamal123@gmail.com ")
        addCustomer(customer: cust4)
        
        let M4: Mobile = Mobile(Id: 1, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 234, mobileManufacturer: "Mi", planName: "Miui", mobileNumber: "+1234567899", internetUsed: 78, minuteUsed: 435)
        
       cust4.addBill(Bill: M4)
        

        
      
       
      
        
        
 
    }
    
}
