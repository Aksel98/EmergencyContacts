//
//  ToastManagerMock.swift
//  EmergencyContactsTests
//
//  Created by Aksel Avetisyan on 08.03.23.
//

@testable import EmergencyContacts

final class ToastManagerMock: ToastManagerProtocol {
    var toastShown = false
    
    func showToast(message: String, duration: Double) {
        toastShown = true
    }
}
