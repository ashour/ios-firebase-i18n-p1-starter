//
//  DB.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-03.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import Firebase

fileprivate func configureDB(_ db: Firestore)
{
    let settings = db.settings
    
    // Firestore will return its own Timestamp objects for timestamps (dates)
    // instead of Date/NSDate
    settings.areTimestampsInSnapshotsEnabled = true
    
    db.settings = settings
}

class DB
{
    fileprivate static var _db: Firestore? = nil
    
    static var instance: Firestore
    {
        get
        {
            if _db == nil
            {
                _db = Firestore.firestore()
                
                configureDB(_db!)
            }
            
            return _db!
        }
    }
    
    static func convert<T>(_ document: [String: Any], _ key: String) -> T?
    {
        return document[key] as? T
    }
    
    static func timestampToDate(_ document: [String: Any], _ key: String)
        -> Date?
    {
        return (convert(document, key) as Timestamp?)?.dateValue()
    }
}
