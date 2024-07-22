//
//  GeocodeRepositoryTests.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 18/06/2024.
//

import Foundation
import XCTest
import Resolver
@testable import TourApp

final class GeocodeRepositoryTests: XCTestCase {
    var mock: APIClientMock!
    override func setUp() {
        super.setUp()
        mock = APIClientMock()
        Resolver.register { self.mock }
            .implements(APIClient.self)
    }
    
    func testGetCurrentGeocodeReturnsSuccess() async {
        //ARRANGE
        let sut = GeocodeRepository()
        mock.objectToReturn = GeocodeResponse.make()
        
        //ACT
        do {
            let response = try await sut.getCurrentGeocode(cityName: "Paris")
            //ASSERT
            XCTAssertEqual(response.name, "London")
            XCTAssertTrue(mock.capturedRequest is GeocodeRequest)
        } catch {
            XCTFail("Expected not to fail")
        }
    }
    
    func testGetCurrentGeocodeReturnsFailure() async {
        //ARRANGE
        let sut = GeocodeRepository()
        mock.errorToReturn = TestError.invalid
        
        //ACT
        do {
            _ = try await sut.getCurrentGeocode(cityName: "Paris")
        } catch { 
            //ASSERT
            XCTAssertTrue(error is TestError)
        }
    }
}
