//
//  GeocodeRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation
import Resolver
import Networking

protocol GeocodeRepositoryProtocol {
    func getCurrentGeocode(cityName: String) async throws -> GeocodeResponse
}

class GeocodeRepository: GeocodeRepositoryProtocol {
    @Injected private var apiClient: APIClient
    
    func getCurrentGeocode(cityName: String) async throws -> GeocodeResponse {
        try await apiClient.perform(request: GeocodeRequest(cityName: cityName))
    }
}
