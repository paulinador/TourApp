//
//  FavoritesViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favoriteObjects = [Properties]()
    
    private let favoriteObjectRepository: FavoriteObjectRepositoryProtocol
    
    init(favoriteObjectRepository: FavoriteObjectRepositoryProtocol) {
        self.favoriteObjectRepository = favoriteObjectRepository
    }
    
    func loadObjects() {
        favoriteObjects = favoriteObjectRepository.getAllObjects()
    }
    
    func removeFavoriteObject(at offsets: IndexSet) {
        let favoriteItems = favoriteObjectRepository.getAllObjects()
        
        offsets.forEach { index in
            let objectToDelete = favoriteItems[index]
            favoriteObjectRepository.deleteObject(object: objectToDelete)
            favoriteObjects.remove(atOffsets: offsets)
        }
    }
}
