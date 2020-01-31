//
//  DetailViewController.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 30/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var detailViewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        closeButton.layer.cornerRadius = 10
        closeButton.clipsToBounds = true
        mapView.setCenter(detailViewModel!.coordinate, animated: true)
    }
}
