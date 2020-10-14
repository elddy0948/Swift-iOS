//
//  ViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit
import FirebaseAuth

struct HomeFeedRenderViewModel {
    let header: PostRenderViewModel
    let post: PostRenderViewModel
    let action: PostRenderViewModel
    let comment: PostRenderViewModel
}

class HomeViewController: UIViewController {
    
    private var feedRenderModels = [HomeFeedRenderViewModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        //Views -> Cells -> IGFeedPostTableViewCell.swift
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.reuseIdentifier)
        tableView.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.reuseIdentifier)
        tableView.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: IGFeedPostActionsTableViewCell.reuseIdentifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.reuseIdentifier)
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
        return feedRenderModels.count * 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //We have 4 Sections
        let x = section
        let model: HomeFeedRenderViewModel
        if x == 0 {
            //Special Case
            model = feedRenderModels[0]
        }
        else {
            let position = x % 4 == 0 ? x / 4 : ((x - (x % 4)) / 4)
            model = feedRenderModels[position]
        }
        
        let subSection = x % 4
        if subSection == 0 {
            //header
            return 1
        }
        else if subSection == 1 {
            //post
            return 1
        }
        else if subSection == 2 {
            //actions
            return 1
        }
        else if subSection == 3 {
            //Comments
            let commentsModel = model.comment
            switch commentsModel.renderType {
            case .comments(let comments): return comments.count > 2 ? 2 : comments.count
            @unknown default: fatalError("Invalid case")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let x = indexPath.section
        let model: HomeFeedRenderViewModel
        if x == 0 {
            //Special Case
            model = feedRenderModels[0]
        }
        else {
            let position = x % 4 == 0 ? x / 4 : ((x - (x % 4)) / 4)
            model = feedRenderModels[position]
        }
        
        let subSection = x % 4
        if subSection == 0 {
            //header
            let headerModel = model.header
            switch headerModel.renderType {
            case .header(let user):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostHeaderTableViewCell else { fatalError("Can't make IGFeedPostHeaderTableViewCell")}
                return cell
            }
        }
        else if subSection == 1 {
            //post
            let postModel = model.post
            switch postModel.renderType {
            case .primaryContent(let post):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostTableViewCell else { fatalError("Can't make IGFeedPostTableViewCell")}
                return cell
            }
        }
        else if subSection == 2 {
            //actions
            let actionModel = model.action
        }
        else if subSection == 3 {
            //Comments
            let commentModel = model.comment
            switch commentModel.renderType {
            case .comments(let comments):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostGeneralTableViewCell else { fatalError("Can't make IGFeedPostGeneralTableViewCell")}
                return cell
            @unknown default: fatalError()
            }
        }
        
        switch model.renderType {
        case .actions(let actions):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostActionsTableViewCell else { fatalError("Can't make IGFeedPostActionsTableViewCell")}
            return cell
        case .comments(let comments):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostGeneralTableViewCell else { fatalError("Can't make IGFeedPostGeneralTableViewCell")}
            return cell
        case .primaryContent(let post):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostTableViewCell else { fatalError("Can't make IGFeedPostTableViewCell")}
            return cell
        case .header(let users):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostHeaderTableViewCell else { fatalError("Can't make IGFeedPostHeaderTableViewCell")}
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        
        switch model.renderType {
        case .actions(_): return 60
        case .comments(_): return 50
        case .primaryContent(_): return tableView.width
        case .header(_): return 70
        }
    }
}
