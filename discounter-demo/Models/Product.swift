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
    typealias OnProductsFetched = (_ products: [Product]) -> Void
    
    typealias Listener = ListenerRegistration
    
                   var name: String
    
                  var store: String
    
               var discount: String
    
     var priceAfterDiscount: String
    
    var priceBeforeDiscount: String
    
                var expires: String
    
               var imageUrl: String
    
    static func fetchFeed(onSuccess: @escaping OnProductsFetched)
    {
        baseQuery().getDocuments
        {
            (querySnapshot, error) in
            
            if let error = error
            {
                print("Error getting documents: \(error)")
                
                return
            }
            
            onSuccess(fromDB(documents: querySnapshot!.documents))
        }
    }
    
    static func listenToFeed(onChange: @escaping OnProductsFetched)
        -> ListenerRegistration
    {
        return baseQuery().addSnapshotListener
        {
            (querySnapshot, error) in

            guard let documents = querySnapshot?.documents else
            {
                print("Error fetching documents: \(error!)")

                return
            }

            onChange(fromDB(documents: documents))
        }
    }
    
    fileprivate static var collection: CollectionReference
    {
        get
        {
            return DB.instance.collection("product-feed")
        }
    }
   
    fileprivate static func baseQuery() -> Query {
        return collection.order(by: "expires")
    }
    
    fileprivate static func fromDB(documents: [QueryDocumentSnapshot])
        -> [Product]
    {
        return documents.map { fromDB(data: $0.data()) }
    }
    
    fileprivate static func fromDB(data: [String: Any]) -> Product
    {
        return Product(
            name: DB.convert(data, "name") ?? "",
            
            store: DB.convert(data, "store") ?? "",
            
            discount: DB.convert(data, "discount") ?? "",
            
            priceAfterDiscount: centsToString(
                DB.convert(data, "priceAfterDiscountInCents") ?? 0),
            
            priceBeforeDiscount: centsToString(
                DB.convert(data, "priceBeforeDiscountInCents") ?? 0),
            
            expires: humanizeDate(date: DB.timestampToDate(data, "expires")),
            
            imageUrl: DB.convert(data, "imageUrl") ?? ""
        )
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
