//
//  TourTabView.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import SwiftUI

struct TourTabView: View {
    @StateObject var viewModel: TourTabViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            SearchView(viewModel: viewModel.viewModelFactory.makeSearchViewModel())
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(TabState.search)
            
            FavoritesView(viewModel: viewModel.viewModelFactory.makeFavoritesViewModel())
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
                .tag(TabState.favorite)
        }
        .tint(.darkGreen)
    }
}
