//
//  APIClient.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import Foundation

protocol APIClient {
    func perform<T: APIRequest> (request: T) async throws -> T.ReturnType
}
