//
//  ViewController.swift
//  SearchBar Practice
//
//  Created by 김호준 on 2020/07/30.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let items = ["Pizza", "Chicken", "Holuck", "Hamburger", "Candy", "Soccer"]
    var filteredItems: [String] = []
    
    
    //검색창이 비어있는지 유무 확인
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.dataSource = self
        
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredItems = items.filter { $0.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchBar.text!)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredItems.count
        }
        else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if isFiltering {
            cell.textLabel?.text = filteredItems[indexPath.row]
        } else {
            cell.textLabel?.text = items[indexPath.row]
        }
        return cell
    }
}
