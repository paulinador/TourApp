//
//  ObjectDownloaderMock.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 18/06/2024.
//

import Foundation
@testable import TourApp

class ObjectDownloaderMock: ObjectRepositoryProtocol {
    var objectToReturn: Codable?
    var errorToReturn: Error?
    
    func getAllObjects(longitude: Double, latitude: Double) async throws -> [TourApp.Feature] {
        if let errorToReturn {
            throw errorToReturn
        } else {
            return objectToReturn as! [Feature]
        }
    }
}
