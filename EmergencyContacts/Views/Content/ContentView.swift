//
//  ContentView.swift
//  EmergencyContacts
//
//  Created by Aksel Avetisyan on 06.03.23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationStack {
            TabbarView()
                .navigationBarTitle("Emergency Contacts")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.theme.white,  for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.light, for: .navigationBar)
        }
        .overlay(ToastView())
        .environmentObject(ToastManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
