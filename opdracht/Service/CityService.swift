//
//  CityService.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 28/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation

final class CityService {
    
    init() {
       
    }
    
    /// returns alpabetically sorted cities based on their name from low to high, without duplicates
    /// - Parameter completion: completes with error or array of cities
    func requestCities(completion: ([City], Error?) -> Void ){
        if let path = Bundle.main.path(forResource: "cities", ofType: "json")
        {
            do {
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let cities = try decoder.decode([City].self, from: data)
                
                let singleCities:[City] = cities.removeDuplicates(cities)
                let sortedCities = singleCities.sorted(by: { $0.name < $1.name })
                completion(sortedCities, nil)
            } catch {
                print(error)
            }
        }
    }
}
