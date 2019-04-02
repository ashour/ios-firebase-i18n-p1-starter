//
//  StringUtil.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-02.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import Foundation

func strikeThrough(_ string: String) -> NSAttributedString
{
    let attributeString: NSMutableAttributedString =
        NSMutableAttributedString(string: string)
    
    attributeString.addAttribute(
        NSAttributedString.Key.strikethroughStyle,
        value: 1,
        range: NSMakeRange(0, attributeString.length)
    )
    
    return attributeString
}
