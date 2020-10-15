//
//  ViewController.swift
//  TableView-Basic(UIKit)
//
//  Created by 김호준 on 2020/06/08.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableViewDatasource = TableViewDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = tableViewDatasource
    }
}

