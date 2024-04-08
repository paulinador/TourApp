//
//  TourAppApp.swift
//  TourApp
//
//  Created by Paulina Dorożko on 05/04/2024.
//

import SwiftUI

@main
struct TourAppApp: App {
    var body: some Scene {
        WindowGroup {
            TourTabView(viewModel: TourTabViewModel())
        }
    }
}
