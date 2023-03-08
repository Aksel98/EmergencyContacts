//
//  SingleContactView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI
import iPhoneNumberField

struct SingleContactView: View {
    @State private var showingAlert = false
    @State var contact: Contact
    @ObservedObject var viewModel: ContactListViewModel
    @EnvironmentObject var toastManager: ToastManager
    @Environment(\.presentationMode) var presentationMode
    
    let headerTitle: String
    
    var body: some View {
        VStack {
            let firstNameTitle = "First Name"
            TextFieldContainerView(title: firstNameTitle, textField: AnyView(TextField(firstNameTitle, text: $contact.firstName).colorScheme(.light)))
                .foregroundColor(.theme.black)
            let lastNameTitle = "Last Name"
            TextFieldContainerView(title: lastNameTitle, textField: AnyView(TextField(lastNameTitle, text: $contact.lastName).colorScheme(.light)))
                .foregroundColor(.theme.black)
            let phoneTitle = "Primary Phone"
            TextFieldContainerView(title: phoneTitle, textField: AnyView(
                iPhoneNumberField(viewModel.phoneFormat, text: $contact.primaryPhone)
                    .foregroundColor(.theme.black)
                    .maximumDigits(10)
                    .defaultRegion("US")
                    .colorScheme(.light))
            )
            Spacer()
            Button(action: {
                viewModel.insertContact(contact)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .foregroundColor(.theme.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
            }
            .disabled(!viewModel.isValidContact(contact))
            .buttonStyle(AppButtonStyle(isDisabled: !viewModel.isValidContact(contact)))
            
            if viewModel.isFromContacts(contact) {
                Button("DELETE CONTACT", action: {
                    showingAlert = true
                })
                .foregroundColor(.theme.blue)
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Delete Contact?"),
                        message: Text("Are you sure you want to remove this contact?"),
                        primaryButton: .default(Text("Yes")) {
                            viewModel.deleteContact(contact)
                            presentationMode.wrappedValue.dismiss()
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(headerTitle).font(.system(size: 17, weight: .regular))
                    .foregroundColor(.theme.black)
            }
        }
        .background(Color.theme.lightGray)
    }
}

struct SingleContactView_Previews: PreviewProvider {
    
    static var previews: some View {
        let contact = Contact(firstName: "firstName", lastName: "lastName", primaryPhone: "primaryPhone")
        SingleContactView(contact: contact, viewModel: ContactListViewModel(), headerTitle: "Add Contact")
    }
}
