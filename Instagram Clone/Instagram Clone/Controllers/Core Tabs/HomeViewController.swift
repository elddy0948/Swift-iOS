//
//  ViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit
import FirebaseAuth

struct HomeFeedRenderViewModel {
    //각 모델마다 하나의 섹션이 있다.
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
        createMockModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createMockModels() {
        let user = User(username: "holuck", bio: "", name: (first: "", last: ""), birth: Date(), profilePhoto: URL(string: "https://www.google.com")!, gender: .male, counts: UserCount(follower: 1, following: 1, posts: 1), joinDate: Date())
        let post = UserPost(identifier: "", postType: .photo, thumbnailImage: URL(string: "https://google.com")!, postURL: URL(string: "https://google.com")!, caption: nil, likeCount: [], comment: [], createdDate: Date(), taggedUsers: [], owner: user)
        var comments = [PostComment]()
        for x in 0..<5 {
            comments.append(PostComment(identifier: "\(x)",
                                        username: "@holuck",
                                        text: "Good Post",
                                        createDate: Date(),
                                        likes: []))
        }
        
        for _ in 0..<5 {
            feedRenderModels.append(HomeFeedRenderViewModel(header: PostRenderViewModel(renderType: .header(provider: user)),
                                                            post: PostRenderViewModel(renderType: .primaryContent(provider: post)),
                                                            action: PostRenderViewModel(renderType: .actions(provider: "")),
                                                            comment: PostRenderViewModel(renderType: .comments(comments: comments))))
        }
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
        //하나의 모델에 4개의 섹션이 있어야 하니 곱하기 4
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
            case .header(provider: _): return 0
            case .primaryContent(provider: _): return 0
            case .actions(provider: _): return 0
            }
        }
        return 0
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
            case .header(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostHeaderTableViewCell else { fatalError("Can't make IGFeedPostHeaderTableViewCell")}
                return cell
            case .primaryContent(provider: _), .actions(provider: _), .comments(comments: _): return UITableViewCell()
            }
        }
        else if subSection == 1 {
            //post
            let postModel = model.post
            switch postModel.renderType {
            case .primaryContent(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostTableViewCell else { fatalError("Can't make IGFeedPostTableViewCell")}
                return cell
            case .actions(provider: _), .comments(comments: _), .header(provider: _): return UITableViewCell()
            }
        }
        else if subSection == 2 {
            //actions
            let actionModel = model.action
            switch actionModel.renderType {
            case .actions(provider: _):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostActionsTableViewCell else { fatalError("Can't make IGFeedPostActionsTableViewCell")}
                return cell
            case .comments(comments: _), .header(provider: _), .primaryContent(provider: _): return UITableViewCell()
            }
        }
        else if subSection == 3 {
            //Comments
            let commentModel = model.comment
            switch commentModel.renderType {
            case .comments(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.reuseIdentifier, for: indexPath) as? IGFeedPostGeneralTableViewCell else { fatalError("Can't make IGFeedPostGeneralTableViewCell")}
                return cell
            case .actions(provider: _), .primaryContent(provider: _), .header(provider: _): return UITableViewCell()
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let subSection = indexPath.section % 4
        if subSection == 0 {
            //Header
            return 70
        }
        else if subSection == 1 {
            //Post
            return tableView.width
        }
        else if subSection == 2 {
            //Actions
            return 60
        }
        else if subSection == 3 {
            //Comments
            return 50
        }
        else {return 0}
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let subSection = section % 4
        return subSection == 3 ? 70 : 0
    }
}
