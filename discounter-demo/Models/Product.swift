//
//  Product.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-02.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

class Product
{
    var name: String
    
    var store: String
    
    var discount: String
    
    var priceAfterDiscount: String
    
    var priceBeforeDiscount: String
    
    var expires: String
    
    init(               name: String,
                       store: String,
                    discount: String,
          priceAfterDiscount: String,
         priceBeforeDiscount: String,
                     expires: String)
    {
        self.name = name
        
        self.store = store
        
        self.discount = discount
        
        self.priceAfterDiscount = priceAfterDiscount
        
        self.priceBeforeDiscount = priceBeforeDiscount
        
        self.expires = expires
    }
}


var products = [
    Product(name: "Nike Air Jordans", store: "Nike Store Downtown", discount: "20% off", priceAfterDiscount: "$199.99", priceBeforeDiscount: "$249.99", expires: "Tuesday"),
    
    Product(name: "PlayStation 4", store: "EG Games", discount: "15% off", priceAfterDiscount: "$2,249.99", priceBeforeDiscount: "$4,234.00", expires: "17 March")
]
