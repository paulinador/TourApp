//
//  FavoritesViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation
import Resolver

final class FavoritesViewModel: ObservableObject {
    @Published var favoriteObjects = [Properties]()
    
    @Injected private var favoriteObjectRepository: FavoriteObjectRepositoryProtocol
    @Injected private var detailsRepository: DetailsRepositoryProtocol
    
    func loadObjects() {
        favoriteObjects = favoriteObjectRepository.getAllObjects()
    }
    
    func removeFavoriteObject(at offsets: IndexSet) {
        let favoriteItems = favoriteObjectRepository.getAllObjects()
        
        offsets.forEach { index in
            let objectToDelete = favoriteItems[index]
            favoriteObjectRepository.deleteObject(objectName: objectToDelete)
            favoriteObjects.remove(atOffsets: offsets)
        }
    }
}
