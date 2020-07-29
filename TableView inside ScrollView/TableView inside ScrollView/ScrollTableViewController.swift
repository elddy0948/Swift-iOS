//
//  ScrollTableViewController.swift
//  TableView inside ScrollView
//
//  Created by 김호준 on 2020/07/29.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ScrollTableViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let tableViewDataSource = TableViewDataSources()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTableView.dataSource = tableViewDataSource
    }
    

}
