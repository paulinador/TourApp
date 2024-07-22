//
//  GeocodeResponseBuilder.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 18/06/2024.
//

import Foundation
@testable import TourApp

extension GeocodeResponse {
    static func make(name: String = "London", country: String = "UK", lat: Double = 52.0, lon: Double = 21.0) -> GeocodeResponse {
        return GeocodeResponse(name: name, country: country, lat: lat, lon: lon)
    }
}
