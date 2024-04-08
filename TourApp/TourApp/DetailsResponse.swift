//
//  DetailsResponse.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

struct DetailsResponse: Codable {
    var xid: String
    let name: String
    let address: Address
    let rate: String
    let kinds: String
    let otm: String
    let wikipedia: String?
    let image: String?
    let preview: Preview?
    let wikipediaExtracts: WikipediaExtracts?
    
    var wikipediaURL: URL? {
        if let wikipediaString = wikipedia, let url = URL(string: wikipediaString) {
            return url
        } else {
            return nil
        }
    }
}

struct Address: Codable {
    let city: String
    let road: String?
    let suburb: String?
    let country: String
    let postcode: String?
    let houseNumber: String?
}

struct Preview: Codable {
    let source: String?
    let height: Int?
    let width: Int?
}

struct WikipediaExtracts: Codable {
    let text: String
}
