//
//  DetailsRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

protocol DetailsRepositoryProtocol {
    func getObjectDetails(xid: String) async throws -> DetailsResponse
}

class DetailsRepository: DetailsRepositoryProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getObjectDetails(xid: String) async throws -> DetailsResponse {
       try await apiClient.perform(request: DetailsRequest(xid: xid))
    }
}
