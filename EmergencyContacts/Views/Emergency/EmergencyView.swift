//
//  EmergencyView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct EmergencyView: View {
    
    @EnvironmentObject private var toastManager: ToastManager
    @ObservedObject var viewModel = ContactListViewModel()
    
    init() {
        viewModel.fetchContacts()
    }
    
    var body: some View {
        VStack {
            EmergencyInfoView()
            ContactsListView(viewModel: viewModel)
            Button(action: {}) {
                NavigationLink(destination: AnyView(SingleContactView(contact: Contact(firstName: "", lastName: "", primaryPhone: ""), viewModel: viewModel, headerTitle: "Add Contact"))) {
                    HStack {
                        Image(systemName: "plus").foregroundColor(.theme.white)
                        Text("ADD A CONTACT")
                            .foregroundColor(.theme.white)
                            .padding(.vertical, 10)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 10)
            .buttonStyle(AppButtonStyle(isDisabled: false))
        }
        .background(Color.theme.lightGray)
        .onAppear {
            viewModel.toastManager = toastManager
        }
    }
}

struct EmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView()
    }
}
