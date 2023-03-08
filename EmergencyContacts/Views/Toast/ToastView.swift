//
//  ToastView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct ToastView: View {
    
    @EnvironmentObject var toastManager: ToastManager
    
    var body: some View {
        ZStack {
            if toastManager.isShowing {
                VStack {
                    Spacer()
                    HStack {
                        Text(toastManager.message)
                            .foregroundColor(.theme.white)
                            .font(.system(size: 14, weight: .semibold))
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundStyle(Color.theme.white, Color.theme.green)
                            .frame(width: 20, height: 20)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.theme.black)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    
                }
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 60)
            }
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView()
    }
}
