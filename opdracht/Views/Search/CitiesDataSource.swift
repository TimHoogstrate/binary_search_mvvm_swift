//
//  CitiesDataSource.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 28/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class CitiesDataSource : GenericDataSource<City>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        
        let city = self.data.value[indexPath.row]
        cell.city = city
        
        return cell
    }
}
