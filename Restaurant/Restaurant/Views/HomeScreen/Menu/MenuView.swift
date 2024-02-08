//
//  MenuView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var menuModel: MenuViewModel
    @ObservedObject var popupModel: PopupViewModel
    
    @State private var searchText = ""
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HeaderView(selectedTab: $selectedTab)
                HeroSectionView(searchText: $searchText, restaurantInfo: .sample)
                MenuBreakdownView(menuModel: menuModel)
                MenuItemsView(menuModel: menuModel, popupModel: popupModel, searchText: searchText)
            }
        }
        .padding(.vertical)
        .onChange(of: selectedTab) { _, _ in
            popupModel.dismiss()
        }
        .onTapGesture {
            withAnimation(.spring) {
                popupModel.dismiss()
            }
        }
        .task {
            await menuModel.load(viewContext)
        }
        .refreshable {
            await menuModel.load(viewContext)
        }
    }
}

#Preview {
    MenuView(menuModel: .init(), popupModel: .init(), selectedTab: .constant(0))
}
