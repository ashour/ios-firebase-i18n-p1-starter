//
//  DesignableUILabel.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-02.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUILabel: UILabel
{
    @IBInspectable
    var leftInset: CGFloat = 0
    {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var topInset: CGFloat = 0
    {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var rightInset: CGFloat = 0
    {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var bottomInset: CGFloat = 0
    {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public var intrinsicContentSize: CGSize
    {
        let size = super.intrinsicContentSize
        
        return CGSize(
            width: size.width + leftInset + rightInset,
            height: size.height + topInset + bottomInset)
    }
    
    override public func drawText(in rect: CGRect)
    {
        let insets = UIEdgeInsets(
               top: topInset,
              left: leftInset,
            bottom: bottomInset,
             right: rightInset)
        
        super.drawText(in: rect.inset(by: insets))
    }

}
