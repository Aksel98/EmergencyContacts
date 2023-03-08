//
//  ContactListViewModel.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 08.03.23.
//

import SwiftUI

final class ContactListViewModel: ObservableObject {
    @Published private(set) var contacts = [Contact]()
    
    let phoneFormat = "(000) 000-0000"
    var toastManager: ToastManagerProtocol?
    private let toastMessage = "Emergency contact %@ successfully"
    
    func fetchContacts() {
        contacts = [
            Contact(firstName: "Anna", lastName: "Simo", primaryPhone: "(000) 000-0000"),
            Contact(firstName: "Simon", lastName: "Hay", primaryPhone: "(111) 111-1111")
        ]
    }
    
    func insertContact(_ contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index] = contact
            toastManager?.showToast(message: String(format: toastMessage, "saved"))
        } else {
            contacts.append(contact)
            toastManager?.showToast(message: String(format: toastMessage, "created"))
        }
    }
    
    func deleteContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        
        contacts.remove(at: index)
        toastManager?.showToast(message: String(format: toastMessage, "deleted"))
    }
    
    func isFromContacts(_ contact: Contact) -> Bool {
        return contacts.contains(where: { $0.id == contact.id })
    }
    
    func isValidContact(_ contact: Contact) -> Bool {
        return !contact.firstName.isEmpty && !contact.lastName.isEmpty && contact.primaryPhone.count == phoneFormat.count
    }
}
