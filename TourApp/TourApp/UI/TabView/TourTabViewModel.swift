//
//  TourTabViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation

enum TabState: Int, CaseIterable {
    case search, favorite
}

final class TourTabViewModel: ObservableObject {
    let viewModelFactory: ViewModelFactoryProtocol
    
    init(viewModelFactory: ViewModelFactoryProtocol) {
        self.viewModelFactory = viewModelFactory
    }
    
    @Published var selectedTab: TabState = .search
}
