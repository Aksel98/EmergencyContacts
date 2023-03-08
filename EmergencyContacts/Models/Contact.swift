//
//  Contact.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 08.03.23.
//

import Foundation

struct Contact: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var primaryPhone: String
}
