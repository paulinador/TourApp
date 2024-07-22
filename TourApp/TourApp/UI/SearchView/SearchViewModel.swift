//
//  SearchViewModel.swift
//  TourApp
//
//  Created by Paulina Dorożko on 08/04/2024.
//

import Foundation
import Resolver

final class SearchViewModel: ObservableObject {
    enum State {
        case loading
        case success
        case error
    }
    
    @Published var state: State = .loading
    @Published var searchName = ""
    @Published var name = ""
    @Published var country = ""
    
    @Published var objectData: [Feature] = []
    private var originalObjectData: [Feature] = []
    
    var hasValidCityName: Bool {
         if searchName.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        return true
    }

    private var response: GeocodeResponse?

    @Injected private var geocodeDownloader: GeocodeRepositoryProtocol
    @Injected private var objectDownloader: ObjectRepositoryProtocol
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor
    func fetchData(cityName: String = "London") async {
        do {
            let result = try await geocodeDownloader.getCurrentGeocode(cityName: cityName)
            response = result
            name = result.name
            country = result.country
            
            let object = try await objectDownloader.getAllObjects(longitude: result.lon, latitude: result.lat)
            objectData = object
            
            state = .success
        } catch {
            state = .error
        }
    }
  
    func searchCity() {
        Task {
            if let city = searchName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                await fetchData(cityName: city)
            }
        }
    }

    func sortByTopRating() {
        originalObjectData = objectData
        objectData.sort(by: { $0.properties.rateEdit > $1.properties.rateEdit })
    }

    func sortByDefault() {
        objectData = originalObjectData
    }
}
