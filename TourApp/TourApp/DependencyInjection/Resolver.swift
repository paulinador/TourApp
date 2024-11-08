//
//  Resolver.swift
//  TourApp
//
//  Created by Paulina Dorożko on 12/06/2024.
//

import Resolver
import Networking

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerNetworking()
        
        registerRepositories()
        
        registerFactories()
    }
    
    private static func registerNetworking() {
        Resolver.register { DefaultAPIClient() }
            .implements(APIClient.self)
    }
    
    private static func registerRepositories() {
        Resolver.register { GeocodeRepository() }
            .implements(GeocodeRepositoryProtocol.self)
        
        Resolver.register { ObjectRepository() }
            .implements(ObjectRepositoryProtocol.self)
        
        Resolver.register { DetailsRepository() }
            .implements(DetailsRepositoryProtocol.self)
        
        Resolver.register { FavoriteObjectRepository() }
            .implements(FavoriteObjectRepositoryProtocol.self)
    }
    
    private static func registerFactories() {
        Resolver.register { ViewModelFactory() }
            .implements(ViewModelFactoryProtocol.self)
    }
    
    
}
