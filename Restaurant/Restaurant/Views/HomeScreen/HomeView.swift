//
//  HomeView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var menuModel = MenuViewModel()
    @StateObject private var popupModel = PopupViewModel()
    @State private var selectedTab = 0
    
    private let persistentController = PersistenceController.shared
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuView(menuModel: menuModel, popupModel: popupModel, selectedTab: $selectedTab)
                .environment(\.managedObjectContext, persistentController.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
                .tag(0)
            
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
                .tag(1)
        }
        .navigationBarBackButtonHidden()
        .popup(with: popupModel)
    }
}

#Preview {
    HomeView()
}
