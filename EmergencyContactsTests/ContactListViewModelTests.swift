//
//  ContactListViewModelTests.swift
//  EmergencyContactsTests
//
//  Created by Aksel Avetisyan on 08.03.23.
//

import XCTest
@testable import EmergencyContacts

final class ContactListViewModelTests: XCTestCase {
    
    var toastManager: ToastManagerMock!
    var viewModel: ContactListViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = ContactListViewModel()
        toastManager = ToastManagerMock()
        viewModel.toastManager = toastManager
        viewModel.fetchContacts()
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
        toastManager = nil
    }
    
    func testFetchContacts() {
        XCTAssertFalse(viewModel.contacts.isEmpty)
    }
    
    func testInsertContact() {
        let contact = Contact(firstName: "John", lastName: "Doe", primaryPhone: "(222) 222-2222")
        XCTAssertFalse(viewModel.contacts.contains(where: { $0.id == contact.id }))
        viewModel.insertContact(contact)
        XCTAssertTrue(viewModel.contacts.contains(where: { $0.id == contact.id }))
        XCTAssertTrue(toastManager.toastShown == true)
    }
    
    func testUpdateContact() throws {
        var contact = try XCTUnwrap(viewModel.contacts.first)
        contact.firstName = "Ben"
        viewModel.insertContact(contact)
        XCTAssertTrue(viewModel.contacts.contains(where: { $0.id == contact.id }))
        XCTAssertTrue(toastManager.toastShown == true)
    }
    
    func testDeleteContact() throws {
        let contact = try XCTUnwrap(viewModel.contacts.first)
        viewModel.deleteContact(contact)
        XCTAssertFalse(viewModel.contacts.contains(where: { $0.id == contact.id }))
        XCTAssertTrue(toastManager.toastShown == true)
    }
    
    func testIsFromContacts() throws {
        let contact = try XCTUnwrap(viewModel.contacts.first)
        XCTAssertTrue(viewModel.isFromContacts(contact))
        XCTAssertFalse(viewModel.isFromContacts(Contact(firstName: "Random", lastName: "Person", primaryPhone: "(999) 999-9999")))
    }
    
    func testIsValidContact() {
        let validContact = Contact(firstName: "John", lastName: "Doe", primaryPhone: "(222) 222-2222")
        XCTAssertTrue(viewModel.isValidContact(validContact))
        let invalidContact1 = Contact(firstName: "", lastName: "Doe", primaryPhone: "(222) 222-2222")
        XCTAssertFalse(viewModel.isValidContact(invalidContact1))
        let invalidContact2 = Contact(firstName: "John", lastName: "", primaryPhone: "(222) 222-2222")
        XCTAssertFalse(viewModel.isValidContact(invalidContact2))
        let invalidContact3 = Contact(firstName: "John", lastName: "Doe", primaryPhone: "(222) 222-22")
        XCTAssertFalse(viewModel.isValidContact(invalidContact3))
    }
}
