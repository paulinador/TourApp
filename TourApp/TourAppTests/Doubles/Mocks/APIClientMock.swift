//
//  APIClientMock.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 18/06/2024.
//

import Foundation
@testable import TourApp


class APIClientMock: APIClient {
    var capturedRequest: (any APIRequest)?
    var errorToReturn: Error?
    var objectToReturn: Codable?
    
    func perform<T>(request: T) async throws -> T.ReturnType where T : TourApp.APIRequest {
        capturedRequest = request
        if let errorToReturn {
            throw errorToReturn
        } else {
            return objectToReturn as! T.ReturnType
        }
    }
    
    
}
