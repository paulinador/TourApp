//
//  ObjectRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation
import Resolver

protocol ObjectRepositoryProtocol {
    func getAllObjects(longitude: Double, latitude: Double) async throws -> [Feature]
}

class ObjectRepository:ObjectRepositoryProtocol {
    @Injected private var apiClient: APIClient
    
    func getAllObjects(longitude: Double, latitude: Double) async throws -> [Feature] {
        try await apiClient.perform(request: ObjectRequest(lon: longitude, lat: latitude)).features
    }
    
    
}
