//
//  ObjectRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

protocol ObjectRepositoryProtocol {
    func getAllObjects(longitude: Double, latitude: Double) async throws -> [Feature]
}

class ObjectRepository:ObjectRepositoryProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getAllObjects(longitude: Double, latitude: Double) async throws -> [Feature] {
        try await apiClient.perform(request: ObjectRequest(lon: longitude, lat: latitude)).features
    }
    
    
}
