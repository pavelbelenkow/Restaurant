//
//  HomeView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct HomeView: View {
    private let persistentController = PersistenceController.shared
    
    var body: some View {
        TabView {
            MenuView()
                .environment(\.managedObjectContext, persistentController.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
            
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
