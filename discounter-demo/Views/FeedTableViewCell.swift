//
//  FeedTableViewCell.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-02.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import UIKit
import SDWebImage

class FeedTableViewCell: UITableViewCell
{

    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var expiryLabel: UILabel!
    
    @IBOutlet weak var priceAfterDiscountLabel: UILabel!
    
    @IBOutlet weak var priceBeforeDiscountLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    func updateUI(with product: Product)
    {
        productNameLabel.text = product.name
        
        storeNameLabel.text = product.store.uppercased()
        
        discountLabel.text = product.discount.uppercased()
        
        expiryLabel.text = "Expires \(product.expires)".uppercased()
        
        priceAfterDiscountLabel.text = product.priceAfterDiscount
        
        priceBeforeDiscountLabel.attributedText =
            strikeThrough(product.priceBeforeDiscount)
        
        productImageView.sd_setImage(with: URL(string: product.imageUrl))
    }
}
