//
//  NotificationViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit

class NotificationViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotificationView = NoNotificationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notification"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
//        spinner.startAnimating()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func noNotificationLayout() {
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationView.frame = CGRect(x: 0, y: 0, width: view.width / 2, height: view.width / 4 )
        noNotificationView.center = view.center
    }
    
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
