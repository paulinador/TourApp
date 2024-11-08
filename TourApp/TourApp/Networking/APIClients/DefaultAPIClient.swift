//
//  DefaultAPIClient.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation
import Networking

class DefaultAPIClient: APIClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func perform<T: APIRequest> (request: T) async throws -> T.ReturnType {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.path = request.path
        urlComponents?.queryItems = request.queries

        if var queryItems = urlComponents?.queryItems {
            queryItems.append(contentsOf: [URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")])
        } else {
            urlComponents?.queryItems = [URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")]
        }

        guard let url = urlComponents?.url else {
            throw APIError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await session.data(for: urlRequest)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let response = try? decoder.decode(T.ReturnType.self, from: data) else {
                print("Error: could not decode JSON data")
                throw APIError.decodingError
            }
            return response
        } catch {
            throw APIError.missingData
        }
    }
    
    private var baseUrl = "https://api.opentripmap.com"
}

enum APIError: Error {
    case invalidURL
    case decodingError
    case missingData
}


