//
//  FirstViewController.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

/**
 ViewController which shows the Corona Data for each country
 */
class CountryListViewController: CoronaTableViewController, UISearchBarDelegate {
    // Task 2
    
    @IBOutlet weak var searchBar: UISearchBar!

    var countryPressed: CountryData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.data = DataModel.shared.countryData
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let countryData = self.data as! [CountryData]
        countryPressed = countryData[indexPath.row]
        self.performSegue(withIdentifier: "ToDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? DetailViewController
        destinationVC!.country = countryPressed
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            let newData: [CoronaData] = [DataModel.shared.countryDict[locationString]!]
            self.data = newData
            tableView.reloadData()
        }
    }
}

