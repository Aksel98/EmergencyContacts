//
//  ContactCell.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct ContactCell: View {
    let contact: Contact
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.headline)
                    .foregroundColor(.theme.black)
                Text(contact.primaryPhone)
                    .font(.subheadline)
                    .foregroundColor(.theme.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing, 15)
                .foregroundColor(.theme.black)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.theme.white)
                .shadow(color: .theme.gray.opacity(0.5), radius: 10, x: 0, y: 10)
        )
    }
}

struct ContactCell_Previews: PreviewProvider {
    static let contact = Contact(firstName: "First Name", lastName: "Last Name", primaryPhone: "111")
    
    static var previews: some View {
        ContactCell(contact: contact)
    }
}
