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
    @Published var selectedTab: TabState = .search
}
