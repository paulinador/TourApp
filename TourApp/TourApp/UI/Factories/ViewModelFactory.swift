//
//  ViewModelFactory.swift
//  TourApp
//
//  Created by Paulina Dorożko on 29/05/2024.
//

import Foundation
import Resolver

protocol ViewModelFactoryProtocol {
    func makeSearchViewModel() -> SearchViewModel
    func makeTourDetailViewModel(properties: Properties, xid: String) -> TourDetailViewModel
    func makeFavoritesViewModel() -> FavoritesViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    @Injected private var geocodeRepository: GeocodeRepositoryProtocol
    @Injected private var objectRepository: ObjectRepositoryProtocol
    @Injected private var detailsRepository: DetailsRepositoryProtocol
    @Injected private var favoritesRepository: FavoriteObjectRepositoryProtocol
    
    func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel()
    }
    
    func makeTourDetailViewModel(properties: Properties, xid: String) -> TourDetailViewModel {
        TourDetailViewModel(xid: xid, properties: properties)
    }
    
    func makeFavoritesViewModel() -> FavoritesViewModel {
        FavoritesViewModel()
    }
}

