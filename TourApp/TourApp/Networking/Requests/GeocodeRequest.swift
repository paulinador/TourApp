//
//  GeocodeRequest.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

struct GeocodeRequest: APIRequest {
    typealias ReturnType = GeocodeResponse
    
    var path: String = "/0.1/en/places/geoname"
    var cityName: String
    
    var queries: [URLQueryItem]? {
        [URLQueryItem(name: "name", value: cityName),
         URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")
        ]
    }
}
