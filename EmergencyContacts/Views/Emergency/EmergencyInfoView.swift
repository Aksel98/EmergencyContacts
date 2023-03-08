//
//  EmergencyInfoView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct EmergencyInfoView: View {
    
    var body: some View {
        Text("List up to four people we can call upon your request in the event of an emergency")
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.theme.black)
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.theme.white)
                    .shadow(color: .theme.gray.opacity(0.5), radius: 10, x: 0, y: 10)
            )
            .padding(20)
    }
}

struct EmergencyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyInfoView()
    }
}
