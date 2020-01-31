//
//  City.swift
//  MVVMAssignment
//
//  Created by Tim Hoogstrate on 27/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation

struct City : Decodable, Hashable{
    var country: String
    var name: String
    var _id: Int
    var coord: Coordinate?
}

struct Coordinate : Decodable, Hashable {
    var lon: Double
    var lat: Double
}
