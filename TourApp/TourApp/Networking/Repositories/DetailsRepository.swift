//
//  DetailsRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation
import Resolver
import Networking

protocol DetailsRepositoryProtocol {
    func getObjectDetails(xid: String) async throws -> DetailsResponse
}

class DetailsRepository: DetailsRepositoryProtocol {
    @Injected private var apiClient: APIClient
    
    func getObjectDetails(xid: String) async throws -> DetailsResponse {
       try await apiClient.perform(request: DetailsRequest(xid: xid))
    }
}
