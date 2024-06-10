//
//  ViewModelFactory.swift
//  TourApp
//
//  Created by Paulina Dorożko on 29/05/2024.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func makeSearchViewModel() -> SearchViewModel
    func makeTourDetailViewModel(properties: Properties, xid: String) -> TourDetailViewModel
    func makeFavoritesViewModel() -> FavoritesViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    private let geocodeRepository: GeocodeRepositoryProtocol
    private let objectRepository: ObjectRepositoryProtocol
    private let detailsRepository: DetailsRepositoryProtocol
    private let favoritesRepository: FavoriteObjectRepositoryProtocol
    
    init(geocodeRepository: GeocodeRepositoryProtocol, objectRepository: ObjectRepositoryProtocol, detailsRepository: DetailsRepositoryProtocol, favoritesRepository: FavoriteObjectRepositoryProtocol) {
        self.geocodeRepository = geocodeRepository
        self.objectRepository = objectRepository
        self.detailsRepository = detailsRepository
        self.favoritesRepository = favoritesRepository

    }
    
    func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(gdownloader: geocodeRepository, odownloader: objectRepository)
    }
    
    func makeTourDetailViewModel(properties: Properties, xid: String) -> TourDetailViewModel {
        TourDetailViewModel(downloader: detailsRepository, xid: xid, favoriteObjectRepository: favoritesRepository, properties: properties)
    }
    
    func makeFavoritesViewModel() -> FavoritesViewModel {
        FavoritesViewModel(favoriteObjectRepository: favoritesRepository, detailsRepository: detailsRepository)
    }
}

