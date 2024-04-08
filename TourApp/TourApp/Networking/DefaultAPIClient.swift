//
//  DefaultAPIClient.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

class DefaultAPIClient: APIClient {
    func perform<T: APIRequest> (request: T) async throws -> T.ReturnType {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.path = request.path
        urlComponents?.queryItems = request.queries
        
        guard let url = urlComponents?.url else {
            throw APIError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let response = try? decoder.decode(T.ReturnType.self, from: data) else {
                print("Error: could not decode JSON data")
                throw APIError.invalidURL
            }
            return response
        } catch {
            throw APIError.invalidURL
        }
    }
    
    private var baseUrl = "https://api.opentripmap.com"
}

enum APIError: Error {
    case invalidURL
}


