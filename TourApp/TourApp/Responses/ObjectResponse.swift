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

struct Feature: Codable, Hashable, Equatable {
    let id: String
    let properties: Properties
    
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        lhs.properties == rhs.properties
    }
}

struct Properties: Codable, Hashable, Identifiable {
    var id: String {
        return xid
    }
    
    let xid: String
    let name: String
    let rate: Int
    let wikidata: String?
    
    var info: String {
        wikidata ?? "N/A"
    }
    
    var infoUrl: String {
        "https://www.wikidata.org/wiki/\(info)"
    }
    
    var rateEdit: Int {
        switch rate {
        case 7: return 3
        case 6: return 2
        case 5: return 1
        default: return rate
        }
    }
    
}


