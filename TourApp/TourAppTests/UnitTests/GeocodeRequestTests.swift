//
//  GeocodeRequestTests.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 17/06/2024.
//

import Foundation
import XCTest
@testable import TourApp

final class GeocodeRequestTests: XCTestCase {
    func testGeocodeRequest() {
        let sut = GeocodeRequest(cityName: "London")
        let queries: [URLQueryItem] =
            [URLQueryItem(name: "name", value: "London"),
             URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")
            ]
        
        XCTAssertEqual(sut.path, "/0.1/en/places/geoname")
        XCTAssertEqual(sut.queries, queries)
        XCTAssertEqual(sut.method, .get)
    }
}
