//
//  ToastManager.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

final class ToastManager: ObservableObject, ToastManagerProtocol {
    @Published private(set) var isShowing = false
    @Published private(set) var message = ""
    
    func showToast(message: String, duration: Double) {
        self.message = message
        self.isShowing = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.isShowing = false
        }
    }
}
