#  TableView Basic Practice!


ViewController.swift
````

@IBOutlet weak var tableView: UITableView!


````

TableViewDatasource.swift

````
class TableViewDatasource: NSObject, UITableViewDataSource {
    
    let items: [String] = ["item1", "item2", "item3", "item4", "item5", "item6", "item7"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
}

````

ViewController.swift
````
    let tableViewDatasource = TableViewDatasource()
````

````
    tableView.dataSource = tableViewDatasource
````


![Simulator Screen Shot - iPhone 11 - 2020-06-08 at 23 47 44](https://user-images.githubusercontent.com/40102795/84046279-d5a1a680-a9e4-11ea-8734-ed9a104b197f.png)

