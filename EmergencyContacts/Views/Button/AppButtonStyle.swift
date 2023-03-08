//
//  AppButtonStyle.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    let isDisabled: Bool
    
    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        let background: Color = configuration.isPressed ? .theme.darkBlue : .theme.blue
        
        configuration.label
            .font(.system(size: 15, weight: .bold))
            .background(background.opacity(isDisabled ? 0.25 : 1))
            .cornerRadius(25)
            .shadow(color: .theme.gray.opacity(0.5), radius: 10, x: 0, y: 10)
            .padding(.horizontal)
            .padding(.bottom, 25)
    }
}
