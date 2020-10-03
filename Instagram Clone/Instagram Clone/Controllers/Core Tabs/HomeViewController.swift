//
//  ViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        //Views -> Cells -> IGFeedPostTableViewCell.swift
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuth()
    }

    
    private func handleNotAuth() {
        //로그인 하지 않았을때 관리
        if Auth.auth().currentUser == nil {
            //로그인 상태가 아니므로 로그인 화면으로 넘겨줘야함.
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostTableViewCell else {fatalError("Can't make IGFeedPostCell!")}
        
        return cell
    }
    
    
}
