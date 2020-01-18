//
//  ContactController.swift
//  Contact
//
//  Created by Maxwell Poffenbarger on 1/18/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation
import CoreData

class ContactController {
    
    static let shared = ContactController()
    
    var fetchedResultsController: NSFetchedResultsController<Contact>
    
    init() {
        
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let resultsController: NSFetchedResultsController<Contact> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "firstLetter", cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing: \(error.localizedDescription)")
        }
        
    }
    
    //MARK: CRUD Functions
    
    func createContactWith(name: String, phone: String?, email: String?) {
        let _ = Contact(name: name, phoneNumber: phone, email: email)
        
        saveToPersistentStore()
    }
    
    func updateContact(_ contact: Contact, name: String, phone: String?, email: String?) {
        contact.name = name
        contact.phoneNumber = phone
        contact.email = email
        
        guard let firstCharacter = name.first else {return}
        let firstLetter = String(firstCharacter).uppercased()
        
        contact.firstLetter = firstLetter
        
        saveToPersistentStore()
    }
    
    func deleteContact(_ contact: Contact) {
        contact.managedObjectContext?.delete(contact)
        
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print(error, error.localizedDescription)
        }
    }
}//End of class
