//
//  Contact+Convenience.swift
//  Contact
//
//  Created by Maxwell Poffenbarger on 1/18/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation
import CoreData

extension Contact {
    
    convenience init?(name: String, phoneNumber: String?, email: String?, context: NSManagedObjectContext = CoreDataStack.context) {
        
        guard let firstCharacter = name.first else {return nil}
        let firstLetter = String(firstCharacter).uppercased()
        
        self.init(context: context)
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.firstLetter = firstLetter
    }
}//End of extension
