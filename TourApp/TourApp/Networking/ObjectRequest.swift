//
//  ObjectRequest.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

struct ObjectRequest: APIRequest {
    typealias ReturnType = ObjectResponse
    
    var path: String = "/0.1/en/places/radius"
    
    var lon: Double
    var lat: Double
    
    var queries: [URLQueryItem]? {
        [URLQueryItem(name: "radius", value: "2000"),
         URLQueryItem(name: "lon", value: "\(lon)"),
         URLQueryItem(name: "lat", value: "\(lat)"),
         URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")
        ]
    }
}
