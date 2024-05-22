//
//  APIRequest.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol APIRequest {
    associatedtype ReturnType: Codable
    var path: String { get }
    var queries: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
}

extension APIRequest {
    var method: HTTPMethod {
        .get
    }
}
