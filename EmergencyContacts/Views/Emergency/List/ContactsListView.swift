//
//  ContactsListView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct ContactsListView: View {
    
    @ObservedObject var viewModel: ContactListViewModel
    
    var body: some View {
        if viewModel.contacts.isEmpty {
            Text("No Contacts")
                .foregroundColor(.theme.blue)
                .font(.system(size: 25, weight: .bold))
            Spacer()
        } else {
            ScrollView {
                ForEach(viewModel.contacts) { contact in
                    NavigationLink(destination: {
                        SingleContactView(contact: contact, viewModel: viewModel, headerTitle: "Edit Contact")
                    }, label: {
                        ContactCell(contact: contact)
                            .padding(.horizontal, 20)
                    })
                }
                Spacer(minLength: 30)
            }
        }
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(viewModel: ContactListViewModel())
    }
}
