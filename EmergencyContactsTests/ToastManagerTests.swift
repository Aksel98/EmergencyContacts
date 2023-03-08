//
//  ToastManagerTests.swift
//  EmergencyContactsTests
//
//  Created by Aksel Avetisyan on 08.03.23.
//

import XCTest
@testable import EmergencyContacts

final class ToastManagerTests: XCTestCase {

    func testShowToast() {
        let toastManager = ToastManager()
        let message = "Hello"
        let duration: Double = 0

        toastManager.showToast(message: message, duration: duration)

        XCTAssertEqual(toastManager.message, message)
        XCTAssertTrue(toastManager.isShowing)

        let expectation = XCTestExpectation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertFalse(toastManager.isShowing)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
