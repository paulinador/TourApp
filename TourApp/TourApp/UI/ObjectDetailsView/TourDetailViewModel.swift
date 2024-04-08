//
//  TourDetailViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation

class TourDetailViewModel: ObservableObject {
    enum State {
        case loading
        case success
        case error
    }
    
    @Published var state: State = .loading
    @Published var name: String = ""
    @Published var country: String = ""
    @Published var city: String = ""
    @Published var objectData: [Feature] = []
    @Published var lon: Double = 0.0
    @Published var lat: Double = 0.0
    @Published var wikiInfo: String = ""
    @Published var imageSource = ""
    
    @Published var xid: String
    
    private let detailsDownloader: DetailsRepositoryProtocol
    
    init(downloader: DetailsRepositoryProtocol, xid: String) {
        self.detailsDownloader = downloader
        self.xid = xid
        
        Task {
            await fetchDetails(xid: xid)
        }
    }
    
    @MainActor
    func fetchDetails(xid: String) async {
        do {
            let detail = try await detailsDownloader.getObjectDetails(xid: xid)
            name = detail.name
            country = detail.address.country
            city = detail.address.city
            wikiInfo = detail.wikipediaExtracts?.text ?? "N/A"
            imageSource = detail.preview?.source ?? "https://cdn.iconscout.com/icon/premium/png-512-thumb/no-photo-3096410-2576513.png?f=webp&w=512"
            
            state = .success
        } catch {
            state = .error
        }
    }
}
