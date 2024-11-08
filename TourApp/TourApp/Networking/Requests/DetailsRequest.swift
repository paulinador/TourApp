//
//  DetailsRequest.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation
import Networking

struct DetailsRequest: APIRequest {
    typealias ReturnType = DetailsResponse
    
    var xid: String
    
    var path: String {
        "/0.1/en/places/xid/\(xid)"
    }
    
    var queries: [URLQueryItem]? {
        [URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")]
    }
    
}
