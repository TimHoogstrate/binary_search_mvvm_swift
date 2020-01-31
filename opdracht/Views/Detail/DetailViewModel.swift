//
//  DetailViewModel.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 30/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation
import MapKit


class DetailViewModel: ObservableObject {

    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    private let city: City
    
    weak var dataSource : GenericDataSource<City>?
    
    init(city: City?) {
        self.city = city!
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D.init(latitude: city.coord!.lat, longitude: city.coord!.lon)
    }
}
