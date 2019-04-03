//
//  Product.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-02.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import Firebase

class Product
{
    fileprivate static let COLLECTION = "product-feed"
    
    var name: String
    
    var store: String
    
    var discount: String
    
    var priceAfterDiscount: String
    
    var priceBeforeDiscount: String
    
    var expires: String
    
    var imageUrl: String
    
    static func fromDB(document: [String: Any]) -> Product
    {
        return Product(
            name: DB.convert(document, "name") ?? "",
            
            store: DB.convert(document, "store") ?? "",
            
            discount: DB.convert(document, "discount") ?? "",
            
            priceAfterDiscount: centsToString(
                DB.convert(document, "priceAfterDiscountInCents") ?? 0),
            
            priceBeforeDiscount: centsToString(
                DB.convert(document, "priceBeforeDiscountInCents") ?? 0),
            
            expires: humanizeDate(date: DB.timestampToDate(document, "expires")),
            
            imageUrl: DB.convert(document, "imageUrl") ?? ""
        )
    }
    
    static func fetchFeed(
        onSuccess: @escaping ((_ products: [Product]) -> Void))
    {
        collection.order(by: "expires").getDocuments()
        {
            (querySnapshot, err) in
            
            if let err = err
            {
                print("Error getting documents: \(err)")
            }
            else
            {
                var products: [Product] = []
                
                for document in querySnapshot!.documents
                {
                    products.append(Product.fromDB(document: document.data()))
                }
                
                onSuccess(products)
            }
        }
    }
    
    fileprivate static var collection: CollectionReference
    {
        get
        {
            return DB.instance.collection(COLLECTION)
        }
    }
    
    init(              name: String,
                      store: String,
                   discount: String,
         priceAfterDiscount: String,
        priceBeforeDiscount: String,
                    expires: String,
                   imageUrl: String)
    {
        self.name = name
        
        self.store = store
        
        self.discount = discount
        
        self.priceAfterDiscount = priceAfterDiscount
        
        self.priceBeforeDiscount = priceBeforeDiscount
        
        self.expires = expires
        
        self.imageUrl = imageUrl
    }
}
