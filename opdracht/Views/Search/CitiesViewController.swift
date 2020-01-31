//
//  ViewController.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 28/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let dataSource = CitiesDataSource()
    
    lazy var citiesViewModel : CitiesViewModel = {
        let viewModel = CitiesViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cities"
        self.citiesViewModel.fetchCities()
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        self.dataSource.data.addObserver(self) { ([City]) in
            self.tableView.reloadData()
        }
        
        // add error handling example
        self.citiesViewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let destinationViewController = segue.destination as? DetailViewController
            {
                let indexPath = self.tableView.indexPathForSelectedRow!
                destinationViewController.detailViewModel = citiesViewModel.detailViewModelForIndexPath(indexPath: indexPath)
            }
        }
    }
}

//Searchbar Delegates
extension CitiesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.citiesViewModel.onSearch(searchText: searchText)
    }
}

//Tebleview Delegates
extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
}
