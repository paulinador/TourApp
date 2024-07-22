//
//  SearchViewModelTests.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 25/06/2024.
//

import Foundation
import XCTest
import Resolver
@testable import TourApp

final class SearchViewModelTests: XCTestCase {
    var mock1: GeocodeDownloaderMock!
    var mock2: ObjectDownloaderMock!
    
    override func setUp() {
        super.setUp()
        
        mock1 = GeocodeDownloaderMock()
        Resolver.register { self.mock1 }
            .implements(GeocodeRepositoryProtocol.self)
        
        mock2 = ObjectDownloaderMock()
        Resolver.register { self.mock2 }
            .implements(ObjectRepositoryProtocol.self)
    }
    
    func testInitialState() {
        mock1.geocodeToReturn = GeocodeResponse.make()
        mock2.objectToReturn = [Feature.make()]
        let sut = SearchViewModel()
        
        XCTAssertEqual(sut.state, .loading)
        XCTAssertTrue(sut.objectData.isEmpty)
    }
    
    func testFetchDataSuccess() async {
        //ARRANGE
        mock1.geocodeToReturn = GeocodeResponse.make()
        mock2.objectToReturn = [Feature.make()]
        
        let sut = SearchViewModel()
        
        //ACT
        await sut.fetchData()
        
        //ASSERT
        XCTAssertEqual(sut.state, .success)
        XCTAssertFalse(sut.objectData.isEmpty)
    }
}
