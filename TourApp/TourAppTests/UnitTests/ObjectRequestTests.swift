//
//  ObjectRequestTests.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 25/06/2024.
//

import Foundation
import XCTest
@testable import TourApp

final class ObjectRequestTests: XCTestCase {
    func testObjectRequest() {
        let sut = ObjectRequest(lon: -0.12574, lat: 51.50853)
        let queries: [URLQueryItem] =
            [URLQueryItem(name: "radius", value: "2000"),
             URLQueryItem(name: "lon", value: "\(-0.12574)"),
             URLQueryItem(name: "lat", value: "\(51.50853)"),
             URLQueryItem(name: "rate", value: "1"),
             URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")
            ]
        
        XCTAssertEqual(sut.path, "/0.1/en/places/radius")
        XCTAssertEqual(sut.queries, queries)
        XCTAssertEqual(sut.method, .get)
    }
}
