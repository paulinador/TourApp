//
//  TourTabViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation
import Resolver

enum TabState: Int, CaseIterable {
    case search, favorite
}

final class TourTabViewModel: ObservableObject {
    @Injected var viewModelFactory: ViewModelFactoryProtocol
    
    @Published var selectedTab: TabState = .search
}
