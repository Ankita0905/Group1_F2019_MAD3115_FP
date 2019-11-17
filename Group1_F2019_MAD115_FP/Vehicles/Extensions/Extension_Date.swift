//
//  Extension_Date.swift
//  Group1_F2019_MAD115_FP
//
//  Created by Ankita Jain on 2019-11-16.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import Foundation

extension Date
{
    public func getForamttedDate() -> String
    {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEEE, dd MMMM, yyyy"
        let formattedDate = dateFormatterPrint.string(from: self)
        return formattedDate
    }
}
