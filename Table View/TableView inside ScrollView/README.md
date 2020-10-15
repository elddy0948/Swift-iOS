#  TableView inside ScrollView


![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-07-29 at 15 52 47](https://user-images.githubusercontent.com/40102795/88766825-ae30b400-d1b3-11ea-8614-d7888fcc3a8e.png)


MyTableViewCell.swift

````
class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView! //<--
    @IBOutlet weak var myLabel: UILabel! //<--
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

````


TableCiewDataSources.swift


````

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

````


ScrollTableViewController.swift

````
let tableViewDataSource = TableViewDataSources()

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    myTableView.dataSource = tableViewDataSource
}
````
