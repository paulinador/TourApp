//
//  ObjectResponse.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

struct ObjectResponse: Codable {
    let features: [Feature]
}

struct Feature: Codable, Hashable {
    let id: String
    let properties: Properties
}

struct Properties: Codable, Hashable {
    let xid: String
    let name: String
    let rate: Int
    let wikidata: String?
    let kinds: String
    
    var info: String {
        wikidata ?? "N/A"
    }
    
    var infoUrl: String {
        "https://www.wikidata.org/wiki/\(info)"
    }
}



