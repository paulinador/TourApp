//
//  FavoriteObjectRepository.swift
//  TourApp
//
//  Created by Paulina Dorożko on 10/04/2024.
//

import Foundation

protocol FavoriteObjectRepositoryProtocol {
    func addFavoriteObject(object: Properties)
    func getAllObjects() -> [Properties]
    func deleteObject(object: Properties)
    func isObjectFavorite(object: Properties) -> Bool
}

class FavoriteObjectRepository: FavoriteObjectRepositoryProtocol {
    private let userDefaults: UserDefaults
    private var allObjects: Set<ObjectResponse> = []
    private let key = "Favorite"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func addFavoriteObject(object: Properties) {
        var objectsSet = Set(getAllObjects())
        objectsSet.insert(object)
        
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
    
    func deleteObject(object: Properties) {
        var objectsSet = Set(getAllObjects())
        objectsSet.remove(object)
        
        if let encoded = try? JSONEncoder().encode(objectsSet) {
            userDefaults.set(encoded, forKey: key)
            
        }
    }
    
    func isObjectFavorite(object: Properties) -> Bool {
        return getAllObjects().contains(object)
    }
}
