//
//  CentsToString.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-03.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import Foundation

func centsToString(_ cents: Int) -> String
{
    let dollars = Double(cents) / 100.0
    
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .currency
    
    return formatter.string(from: NSNumber(value: dollars))!
}
