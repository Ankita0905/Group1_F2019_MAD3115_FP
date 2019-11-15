//
//  Bill.swift
//  C0751093_MidTerm_MAD3115S2019
//
//  Created by Neeraj Prasher on 2019-07-11.
//  Copyright © 2019 njprasher. All rights reserved.
//

import Foundation

enum billTypes: String {
    case Mobile = "Mobile"
    case Internet = "Internet"
    case Hydro = "Hydro"
}

class Bill
{
    var Id: Int
    var billDate: Date
    var billType: billTypes
    var totalBillAmount: Float
    
    
    init(Id: Int, billDate: Date, billType: billTypes, totalBillAmount: Float)
    {
        self.Id = Id
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = totalBillAmount
    }
}
