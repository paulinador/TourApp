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
        List {
            ForEach(viewModel.favoriteObjects) { favorite in
                Text(favorite.name)
            }
            .onDelete(perform: viewModel.removeFavoriteObject)
        }
        .onAppear {
            viewModel.loadObjects()
        }
    }
}
