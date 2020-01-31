//
//  FilterService.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 31/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation

class FilteringService {
    
    /// Returns an array of filtered cities
    /// - Parameters:
    ///   - cities: array to be filtered
    ///   - searchText: filter text (also starts with)...
    static func filter(in cities: [City], for searchText: String) -> [City]
    {
        var left = 0
        var right = cities.count - 1
        
        left = lowerbound(cities: cities, searchText: searchText, lb: left, ub: right) + 1
        right = upperbound(cities: cities, searchText: searchText, lb: 0, ub: right) - 1
        
        guard right >= left else {
            return []
        }
        return Array(cities[left...right])
    }

    private static func upperbound(cities:[City], searchText: String, lb: Int, ub: Int) -> Int {
        var left = lb
        var right = ub
        while left <= right {
            let middle = Int(ceil(Double(left + right) / 2.0))
            if cities[middle].name <= searchText || cities[middle].name.starts(with: searchText) {
                left = middle + 1
            } else if cities[middle].name > searchText {
                right = middle - 1
            } else {
                return left
            }
        }
        return left
    }

    private static func lowerbound(cities:[City], searchText: String, lb: Int, ub: Int) -> Int {
        var left = lb
        var right = ub
        while left < right {
            let middle = Int(floor(Double(left + right) / 2.0))
            if cities[middle].name >= searchText {
                right = middle - 1
            } else if cities[middle].name <= searchText {
                left = middle + 1
            } else {
                return right
            }
        }
        return right
    }
}
