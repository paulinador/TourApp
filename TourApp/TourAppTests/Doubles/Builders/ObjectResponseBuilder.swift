//
//  ObjectResponseBuilder.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 18/06/2024.
//

import Foundation
@testable import TourApp

extension Properties {
    static func make(xid: String = "1", name: String = "Eiffel Tower", rate: Int = 3, wikidata: String = "Great") -> Properties {
        return Properties(xid: xid, name: name, rate: rate, wikidata: wikidata)
    }
}

extension Feature {
    static func make(id: String = "1", properties: Properties = .make()) -> Feature {
        return Feature(id: id, properties: properties)
    }
}

extension ObjectResponse {
    static func make(features: [Feature] = [.make()]) -> ObjectResponse {
        return ObjectResponse(features: features)
    }
    
}
