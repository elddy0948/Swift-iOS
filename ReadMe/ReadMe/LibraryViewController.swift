import UIKit


//Section을 Custom하기 위한 Class
class LibraryHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier = "\(LibraryHeaderView.self)"
    @IBOutlet var titleLabel: UILabel!
}

class LibraryViewController: UITableViewController {
    
    enum Section: String, CaseIterable {
        case addNew
        case readMe = "Read Me!"
        case finished = "Finished"
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, Book>!
    
    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let book = dataSource.itemIdentifier(for: indexPath)
        else {fatalError("Nothing selected")}
        return DetailViewController(coder: coder, book: book)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "\(LibraryHeaderView.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: LibraryHeaderView.reuseIdentifier)
        
        configureDataSource()
        updateDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        updateDataSource()
    }
    
    // MARK:- Delegate
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Read Me!" : nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil }
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: LibraryHeaderView.reuseIdentifier) as? LibraryHeaderView else { return nil }
        
        headerView.titleLabel.text = Section.allCases[section].rawValue
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section != 0 ? 60 : 0
    }
    
    // MARK:- DataSource
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, book) -> UITableViewCell? in
            if indexPath == IndexPath(row: 0, section: 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath)
                return cell
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell else {fatalError("Could not create Book Cell")}
            
            cell.titleLabel?.text = book.title
            cell.authorLabel.text = book.author
            cell.bookThumbnail?.image = book.image ?? LibrarySymbol.letterSquare(letter: book.title.first).image
            cell.bookThumbnail.layer.cornerRadius = 12
            
            if let review = book.review {
                cell.reviewLabel.text = review
                cell.reviewLabel.isHidden = false
            }
            
            cell.readMeBookmark.isHidden = !book.readMe
            return cell
        })
    }
    
    func updateDataSource() {
        var newSnapShot = NSDiffableDataSourceSnapshot<Section, Book>()
        newSnapShot.appendSections(Section.allCases)
        let booksByReadMe: [Bool: [Book]] = Dictionary(grouping: Library.books, by: \.readMe)
        for (readMe, books) in booksByReadMe {
            newSnapShot.appendItems(books, toSection: readMe ? .readMe : .finished)
        }
        newSnapShot.appendItems([Book.mockBook], toSection: .addNew)
        dataSource.apply(newSnapShot, animatingDifferences: true)
        
    }
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        //Section의 개수
    //        return 2
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return section == 0 ? 1 : Library.books.count
    //        // +1을 한 이유는 Add New Book Cell이 하나 추가 되어서이다.
    //    }
    //
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        if indexPath == IndexPath(row: 0, section: 0) {
    //            let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath)
    //            return cell
    //        }
    //
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell else {fatalError("Could not create Book Cell")}
    //
    //        let book = Library.books[indexPath.row]
    //        cell.titleLabel?.text = book.title
    //        cell.authorLabel.text = book.author
    //        cell.bookThumbnail?.image = book.image
    //        cell.bookThumbnail.layer.cornerRadius = 12
    //        return cell
    //    }
}

