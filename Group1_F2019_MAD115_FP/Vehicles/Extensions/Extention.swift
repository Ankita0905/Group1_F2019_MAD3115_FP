//
//  Extention.swift
//  Group1_F2019_MAD3004_FP
//
//  Created by Sandeep Jangra on 2019-10-24.
//  Copyright © 2019 MacStudent. All rights reserved.
//


import Foundation
extension Float {
    //code seen from Google
    func currencyFormat() ->String
    {
        return String(format: "$%0.2f", locale: Locale.current, Float(self))
    }
    
    func hours() -> String {
           return "\(self) Hrs"
    }
}
