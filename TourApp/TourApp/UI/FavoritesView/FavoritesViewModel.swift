//
//  FavoritesViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation

//struct FavoritePlace: Identifiable, Hashable {
//    var id: String
//    let name: String
//    let city: String
//}
//
//struct SectionData: Identifiable {
//    let id = UUID()
//    let title: String
//    var items: [FavoritePlace]
//}

class FavoritesViewModel: ObservableObject {
    @Published var favoriteObjects = [Properties]()
    
    private let favoriteObjectRepository: FavoriteObjectRepositoryProtocol
    private let detailsRepository: DetailsRepositoryProtocol
    
    init(favoriteObjectRepository: FavoriteObjectRepositoryProtocol, detailsRepository: DetailsRepositoryProtocol) {
        self.favoriteObjectRepository = favoriteObjectRepository
        self.detailsRepository = detailsRepository
    }
    
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
