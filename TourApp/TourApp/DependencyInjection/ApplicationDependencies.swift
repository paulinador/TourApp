//
//  ApplicationDependencies.swift
//  TourApp
//
//  Created by Paulina Dorożko on 06/06/2024.
//

import Foundation

protocol ApplicationDependenciesProtocol {
    var apiClient: APIClient { get }
    var viewModelFactory: ViewModelFactoryProtocol { get }
}

class ApplicationDependencies: ApplicationDependenciesProtocol {
    lazy var apiClient: any APIClient = DefaultAPIClient()
    
    lazy var viewModelFactory: any ViewModelFactoryProtocol = {
        ViewModelFactory(geocodeRepository: GeocodeRepository(apiClient: apiClient),
                         objectRepository: ObjectRepository(apiClient: apiClient),
                         detailsRepository: DetailsRepository(apiClient: apiClient),
                         favoritesRepository: FavoriteObjectRepository())
    }()
}
