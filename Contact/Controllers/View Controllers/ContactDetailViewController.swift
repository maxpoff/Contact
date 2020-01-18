//
//  EntryDetailViewController.swift
//  Contact
//
//  Created by Maxwell Poffenbarger on 1/18/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else {return}
        let phone = phoneTextField.text
        let email = emailTextField.text
        
        if let contact = contact {
            ContactController.shared.updateContact(contact, name: name, phone: phone, email: email)
        } else {
            ContactController.shared.createContactWith(name: name, phone: phone, email: email)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let contact = contact else {return}
        
        nameTextField.text = contact.name
        if let phoneNumber = contact.phoneNumber {
            phoneTextField.text = phoneNumber
        }
        if let email = contact.email {
            emailTextField.text = email
        }
    }
}//End of class
