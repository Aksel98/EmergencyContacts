//
//  TabbarView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 07.03.23.
//

import SwiftUI

struct TabbarView: View {
    
    @ObservedObject var viewModel = TabbarViewModel()
    @State private var selection = 2
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        viewModel.fetchItems()
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(viewModel.items) { item in
                item.view.tabItem {
                    item.image
                    item.text
                }.tag(item.id)
            }
        }
        .accentColor(.blue)
        .background(Color.theme.white)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
