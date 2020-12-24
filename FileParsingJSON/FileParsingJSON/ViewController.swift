//
//  ViewController.swift
//  FileParsingJSON
//
//  Created by 김호준 on 2020/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var result: Result = {
        var result = Result(data: [])
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do {
                let dataJSON = try Data(contentsOf: url)
                result = try JSONDecoder().decode(Result.self
                                                  , from: dataJSON)
            } catch {
                return result
            }
        }
        return result
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        parseJSON()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let dataJSON = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: dataJSON)
        } catch {
            print("Error \(error)")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return result.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.data[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = result.data[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result.data[section].title
    }
}
