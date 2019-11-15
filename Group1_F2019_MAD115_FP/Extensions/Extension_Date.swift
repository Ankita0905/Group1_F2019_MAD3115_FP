//
//  Extension_Date.swift
//  C0751093_MidTerm_MAD3115S2019
//
//  Created by Neeraj Prasher on 2019-07-12.
//  Copyright © 2019 njprasher. All rights reserved.
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
