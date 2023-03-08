//
//  TextFieldContainerView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct TextFieldContainerView: View {
    
    let title: String
    let textField: AnyView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .foregroundColor(.theme.gray)
            VStack(alignment: .leading, spacing: 5) {
                textField
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.theme.white)
                    .shadow(color: .theme.gray.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        .padding(.horizontal, 20)
    }
    
}

struct TextFieldContainerView_Previews: PreviewProvider {
    @State static var name: String = "Name"
    
    static var previews: some View {
        let title = "First Name"
        TextFieldContainerView(title: title, textField: AnyView(TextField(title, text: $name)))
    }
}
