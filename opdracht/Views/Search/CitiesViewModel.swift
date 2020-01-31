//
//  ViewModel.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 28/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation


class CitiesViewModel: ObservableObject {

    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    weak var dataSource : GenericDataSource<City>?
    
    var sortedCities:[City] = []
    
    init(dataSource: GenericDataSource<City>?) {
        self.dataSource = dataSource
    }
    
    func fetchCities() {
        CityService.init().requestCities { (cities, error) in
            sortedCities = cities
            self.dataSource!.data.value = cities
        }
    }
    
    func onSearch(searchText: String) {
        
        guard !searchText.isEmpty else {
            //return all cities
            self.dataSource!.data.value = sortedCities
            return
        }
    
        self.dataSource!.data.value = FilteringService.filter(in: sortedCities, for: searchText)
    }
    
    func detailViewModelForIndexPath(indexPath: IndexPath) -> DetailViewModel {
        let city = self.dataSource!.data.value[indexPath.row]
        return DetailViewModel(city: city)
    }
}
