//
//  GeocodeDownloaderMock.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 18/06/2024.
//

import Foundation
@testable import TourApp

class GeocodeDownloaderMock: GeocodeRepositoryProtocol {
    var geocodeToReturn: Codable?
    var errorToReturn: Error?
    
    func getCurrentGeocode(cityName: String) async throws -> TourApp.GeocodeResponse {
        if let errorToReturn {
            throw errorToReturn
        } else {
            return geocodeToReturn as! GeocodeResponse
        }
    }
}
