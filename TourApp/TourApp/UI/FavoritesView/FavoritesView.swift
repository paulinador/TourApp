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
                ForEach(viewModel.favoriteObjects) { favorite in
                            NavigationLink(destination:
                                            TourDetailView(viewModel: TourDetailViewModel(
                                                xid: favorite.id,
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
            }
            .scrollContentBackground(.hidden)
            .background(.lightBackground)
            .navigationTitle("Favorite Objects")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadObjects()
            }
        }
        
    }
}

