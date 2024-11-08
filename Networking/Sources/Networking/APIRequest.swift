//
//  APIRequest.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
}

public protocol APIRequest {
    associatedtype ReturnType: Codable
    var path: String { get }
    var queries: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
}

public extension APIRequest {
    var method: HTTPMethod {
        .get
    }
}
