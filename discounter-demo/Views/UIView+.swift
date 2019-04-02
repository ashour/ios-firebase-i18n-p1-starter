//
//  UIView+.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-02.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView
{
    
    @IBInspectable
    var cornerRadius: CGFloat
    {
        get
        {
            return layer.cornerRadius
        }
        
        set
        {
            layer.masksToBounds = newValue > 0
            
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor
    {
        get
        {
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        
        set
        {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize
    {
        get
        {
            return layer.shadowOffset
        }
        
        set
        {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat
    {
        get
        {
            return layer.shadowRadius
        }
        
        set
        {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float
    {
        get
        {
            return layer.shadowOpacity
        }
        
        set
        {
            layer.shadowOpacity = newValue
        }
    }
    
}
