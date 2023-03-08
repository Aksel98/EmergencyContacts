//
//  ToastManagerProtocol.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 08.03.23.
//

import Foundation

protocol ToastManagerProtocol {
    func showToast(message: String, duration: Double)
}

extension ToastManagerProtocol {
    func showToast(message: String) {
        showToast(message: message, duration: 5)
    }
}
