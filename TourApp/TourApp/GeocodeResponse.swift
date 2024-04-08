//
//  GeocodeResponse.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

struct GeocodeResponse: Codable {
    let name: String
    let country: String
    let lat: Double
    let lon: Double
}
