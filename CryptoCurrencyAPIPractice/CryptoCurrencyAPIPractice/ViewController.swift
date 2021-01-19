import UIKit


class ViewController: UIViewController {
    private var cryptoCurrency: CurrencyData?
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(CryptoTableViewCell.self,
                           forCellReuseIdentifier: CryptoTableViewCell.reuseIdentifier)
        return tableView
    }()
    let dispatchQueue = DispatchQueue(label: "dispatchQueue")
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrencyData()
        dispatchGroup.notify(queue: .main, execute: {
            self.tableView.reloadData()
        })
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func getCurrencyData() {
        let urlComponents = URLComponents(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest")
        guard let url = urlComponents?.url else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue(PrivacyComponents.API_KEY, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        dispatchGroup.enter()
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    fatalError()
                }
                do {
                    let json = try JSONDecoder().decode(CurrencyData.self
                                                        , from: data)
                    self.cryptoCurrency = json
                    self.dispatchGroup.leave()
                } catch let error {
                    fatalError("\(error)")
                }
            }.resume()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cryptoCount = cryptoCurrency?.cryptoData?.count {
            print("hello")
            return cryptoCount
        } else {
            print("Bye")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? CryptoTableViewCell else {
            return UITableViewCell()
        }
        if let cryptoData = cryptoCurrency?.cryptoData?[indexPath.row] {
            cell.configureCell(with: cryptoData)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

