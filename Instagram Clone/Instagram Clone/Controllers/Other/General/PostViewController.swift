//
//  PostViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit


/*
 Section
 - Header model
 Section
 - Post Cell model
 Section
 - action buttons cell model
 Section
 - n number of general models for comments
 */

///States of a rendered Cell
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost) //Post
    case actions(provider: String)    //like, comment, share
    case comments(comments: [PostComment])
}

///Model of rendered Post
struct PostRenderViewModel {
    let renderType: PostRenderType
}

class PostViewController: UIViewController {
    
    private let model: UserPost?
    
    private var renderModels = [PostRenderViewModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.reuseIdentifier)
        tableView.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.reuseIdentifier)
        tableView.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: IGFeedPostActionsTableViewCell.reuseIdentifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    init(model: UserPost?) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        configureModels()
    }
    
    private func configureModels() {
        guard let userPostModel = self.model else {
            return
        }
        // Header
        renderModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        // Post
        renderModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
        // Actions
        renderModels.append(PostRenderViewModel(renderType: .actions(provider: "")))
        //4 Comments
        var comments = [PostComment]()
        for x in 0..<4 {
            comments.append(PostComment(identifier: "123_\(x)", username: "@Hoo", text: "Great Post", createDate: Date(), likes: []))
        }
        renderModels.append(PostRenderViewModel(renderType: .comments(comments: comments)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor =  .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType {
        case .actions(_):
            return 1
        case .comments(let comments):
            return comments.count > 4 ? 4 : comments.count
        case .primaryContent(_):
            return 1
        case .header(_):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
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
