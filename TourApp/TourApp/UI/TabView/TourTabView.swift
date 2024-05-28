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
            SearchView(viewModel: SearchViewModel(gdownloader: GeocodeRepository(apiClient: DefaultAPIClient()),
                                                  odownloader: ObjectRepository(apiClient: DefaultAPIClient())))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(TabState.search)
            
            FavoritesView(viewModel: FavoritesViewModel(favoriteObjectRepository: FavoriteObjectRepository(),
                                                        detailsRepository: DetailsRepository(apiClient: DefaultAPIClient())))
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
                .tag(TabState.favorite)
        }
        .tint(Color(red: 19 / 255, green: 42 / 255, blue: 19 / 255))
    }
}
