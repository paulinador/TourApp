//
//  DetailsRequestTests.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 25/06/2024.
//

import Foundation
import XCTest
@testable import TourApp

final class DetailsRequestTests: XCTestCase {
    func testDetailsRequest() {
        let xid = "W467588395"
        let sut = DetailsRequest(xid: xid)
        let queries: [URLQueryItem] =
            [URLQueryItem(name: "apikey", value: "5ae2e3f221c38a28845f05b643aef45e9b08dee93b3d51ec44afe09a")]
        
        XCTAssertEqual(sut.path, "/0.1/en/places/xid/W467588395")
        XCTAssertEqual(sut.queries, queries)
        XCTAssertEqual(sut.method, .get)
    }
}
