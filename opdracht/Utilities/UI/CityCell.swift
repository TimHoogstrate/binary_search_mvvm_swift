//
//  CityCell.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 28/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    var city : City? {
        didSet {
            guard let city = city else {
                return
            }
            title?.text = city.name + " " + city.country
            subTitle?.text = "Lat: \(city.coord?.lat ?? 0) Lon: \(city.coord?.lon ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
