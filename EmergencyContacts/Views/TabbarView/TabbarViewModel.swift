//
//  TabbarViewModel.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 08.03.23.
//

import SwiftUI

final class TabbarViewModel: ObservableObject {
    @Published private(set) var items = [TabbarItem]()
    
    func fetchItems() {
        items = [
            TabbarItem(id: 1, text: Text("Home"), image: Image(systemName: "house"), view: AnyView(Text("Coming soon").bold())),
            TabbarItem(id: 2, text: Text("Home"), image: Image(systemName: "car"), view: AnyView(EmergencyView())),
            TabbarItem(id: 3, text: Text("Location"), image: Image(systemName: "location"), view: AnyView(Text("Coming soon").bold())),
            TabbarItem(id: 4, text: Text("Support"), image: Image(systemName: "headphones"), view: AnyView(Text("Coming soon").bold())),
            TabbarItem(id: 5, text: Text("Settings"), image: Image(systemName: "gear"), view: AnyView(Text("Coming soon").bold()))
        ]
    }
}
