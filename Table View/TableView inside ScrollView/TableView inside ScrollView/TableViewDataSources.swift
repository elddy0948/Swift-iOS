//
//  TableViewDataSources.swift
//  TableView inside ScrollView
//
//  Created by 김호준 on 2020/07/29.
//  Copyright © 2020 김호준. All rights reserved.
//

import Foundation
import UIKit


class TableViewDataSources: NSObject, UITableViewDataSource {
    let items = ["ocean", "sunflower", "space", "sky"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myLabel.text = items[indexPath.row]
        cell.myImageView.image = UIImage(named: items[indexPath.row])
        return cell
    }
}
