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
            List {
//                ForEach(viewModel.favoriteObjects) { city in
//                    Section(header: Text(city.title)) {
                ForEach(viewModel.favoriteObjects) { favorite in
                            NavigationLink(destination:
                                            TourDetailView(viewModel: TourDetailViewModel(
                                                downloader: DetailsRepository(apiClient: DefaultAPIClient()),
                                                xid: favorite.id,
                                                favoriteObjectRepository: FavoriteObjectRepository(),
                                                properties: favorite)
                                            ))
                            {
                                Text(favorite.name)
                                    .foregroundStyle(.lightBeige)
                            }
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.darkGreen)
                                    .padding(2))
                        }
                        .onDelete(perform: viewModel.removeFavoriteObject)
//                    }
//                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(red: 200 / 255, green: 213 / 255, blue: 185 / 255))
            .navigationTitle("Favorite Objects")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadObjects()
            }
        }
        
    }
}

