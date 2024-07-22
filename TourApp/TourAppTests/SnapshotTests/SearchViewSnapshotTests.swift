//
//  SearchViewSnapshotTests.swift
//  TourAppTests
//
//  Created by Paulina Dorożko on 25/06/2024.
//

import Foundation
import XCTest
import Resolver
import SnapshotTesting
@testable import TourApp

final class SearchViewSnapshotTests: XCTestCase {
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
        
        mock1.geocodeToReturn = GeocodeResponse.make()
        mock2.objectToReturn = [Feature.make()]
    
    }
    
    func testInitialState() {
        let viewModel = SearchViewModel()
        let view = SearchView(viewModel: viewModel)
        
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12Pro)))
    }
    
    func testLoadedState() {
        let viewModel = SearchViewModel()
        let view = SearchView(viewModel: viewModel)
        viewModel.state = .success
        
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12Pro)))
    }
    
    func testLoadedStateWithData() {
        let viewModel = SearchViewModel()
        
        mock1.geocodeToReturn = GeocodeResponse.make()
        
        viewModel.name = "Test"
        viewModel.country = "Test"
        viewModel.objectData = [Feature.make()]
        viewModel.state = .success
        let view = SearchView(viewModel: viewModel)
        
        
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12Pro)))
    }


    
  
}
