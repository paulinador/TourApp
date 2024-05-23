//
//  SearchViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    enum State {
        case loading
        case success
        case error
    }
    
    @Published var state: State = .loading
    @Published var searchName = ""
    @Published var name = ""
    @Published var country = ""
    @Published var lat = 0.0
    @Published var lon = 0.0
    @Published var rate = 0

    @Published var objectData: [Feature] = []
    @Published var originalObjectData: [Feature] = []
    
    private let geocodeDownloader: GeocodeRepositoryProtocol
    private let objectDownloader: ObjectRepositoryProtocol
    
    init(gdownloader: GeocodeRepositoryProtocol, odownloader: ObjectRepositoryProtocol) {
        self.geocodeDownloader = gdownloader
        self.objectDownloader = odownloader
        
        Task {
            await fetchData()
        }
    }
    
    @MainActor
    func fetchData(cityName: String = "London", longitude: Double = -0.125, latitude: Double = 51.508) async {
        do {
            let result = try await geocodeDownloader.getCurrentGeocode(cityName: cityName)
            name = result.name
            country = result.country
            lat = result.lat
            lon = result.lon
            
            let object = try await objectDownloader.getAllObjects(longitude: lon, latitude: lat)
            objectData = object
            
            state = .success
        } catch {
            state = .error
        }
    }
  
    func searchCity() async {
        if let city = self.searchName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            await fetchData(cityName: city, longitude: lon, latitude: lat)
        }
    }
}
