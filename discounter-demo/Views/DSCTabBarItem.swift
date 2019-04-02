//
//  DSCTabBarItem.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-01.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import UIKit

class DSCTabBarItem: UITabBarItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setCustomFont()
    }
    
    fileprivate func setCustomFont() {
        let textAttributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.font:
                UIFont(name: "NotoSans-Medium", size: 10)!]
        
        setTitleTextAttributes(textAttributes, for: .normal)
    }
}
