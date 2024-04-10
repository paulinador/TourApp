//
//  ObjectResponse.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

struct ObjectResponse: Codable, Hashable {
    let features: [Feature]
}

struct Feature: Codable, Hashable {
    let id: String
    let properties: Properties
}

struct Properties: Codable, Hashable, Identifiable {
    var id: String {
        return xid
    }
    
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
    
    var rateEdit: Int {
        if rate == 7 {
            return 3
        } else if rate == 6 {
            return 2
        } else if rate == 5 {
            return 1
        } else {
            return rate
        }
    }
}



