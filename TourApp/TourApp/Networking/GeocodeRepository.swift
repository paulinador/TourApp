//
//  GeocodeRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

protocol GeocodeRepositoryProtocol {
    func getCurrentGeocode(cityName: String) async throws -> GeocodeResponse
}

class GeocodeRepository: GeocodeRepositoryProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getCurrentGeocode(cityName: String) async throws -> GeocodeResponse {
        do {
            let geocode = try await apiClient.perform(request: GeocodeRequest(cityName: cityName))
            return geocode
        } catch {
            throw error
        }
    }
}
