//
//  FavoritesView.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.favoriteObjects) { favorite in
                    NavigationLink(destination:
                                    TourDetailView(viewModel: TourDetailViewModel(
                                        downloader: DetailsRepository(apiClient: DefaultAPIClient()),
                                        xid: favorite.xid,
                                        favoriteObjectRepository: FavoriteObjectRepository(),
                                        properties: favorite)
                                    )) {
                        Text(favorite.name)
                    }
                }
                .onDelete(perform: viewModel.removeFavoriteObject)
            }
            .navigationTitle("Favorite Objects")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.loadObjects()
        }
        
    }
}

