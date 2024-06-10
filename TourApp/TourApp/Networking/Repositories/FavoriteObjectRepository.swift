//
//  FavoriteObjectRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 10/04/2024.
//

import Foundation

protocol FavoriteObjectRepositoryProtocol {
    func addFavoriteObject(objectName: Properties)
    func getAllObjects() -> [Properties]
    func deleteObject(objectName: Properties)
    func isObjectFavorite(objectName: Properties) -> Bool
}

class FavoriteObjectRepository: FavoriteObjectRepositoryProtocol {
    private let userDefaults: UserDefaults

    private var allObjects: Set<DetailsResponse> = []
    private let key = "Favorite"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func addFavoriteObject(objectName: Properties) {
        var objectsSet = Set(getAllObjects())
        objectsSet.insert(objectName)
        
        if let encoded = try? JSONEncoder().encode(objectsSet) {
            userDefaults.set(encoded, forKey: key)
        }
    }
    
    func getAllObjects() -> [Properties] {
        if let data = userDefaults.data(forKey: key), let objects = try? JSONDecoder().decode([Properties].self, from: data) {
            return objects
        } else {
            return []
        }
    }
    
    func deleteObject(objectName: Properties) {
        var objectsSet = Set(getAllObjects())
        objectsSet.remove(objectName)
        
        if let encoded = try? JSONEncoder().encode(objectsSet) {
            userDefaults.set(encoded, forKey: key)
        }
    }
    
    func isObjectFavorite(objectName: Properties) -> Bool {
        return getAllObjects().contains(objectName)
    }
}
