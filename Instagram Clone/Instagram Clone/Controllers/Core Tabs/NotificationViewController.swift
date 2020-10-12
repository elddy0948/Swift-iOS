//
//  NotificationViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit

enum UserNotificationType {
    case like(post: UserPost)
    case follow(state: FollowState)
}

struct UserNotification {
    let type: UserNotificationType
    let text: String
    let user: User
}

final class NotificationViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = false
        table.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.reuseIdentifier)
        table.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.reuseIdentifier)
        return table
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotificationView = NoNotificationView()
    
    private var models = [UserNotification]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotification()
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
    
    private func fetchNotification() {
        for x in 0...100 {
            let post = UserPost(identifier: "", postType: .photo, thumbnailImage: URL(string: "https://google.com")!, postURL: URL(string: "https://google.com")!, caption: nil, likeCount: [], comment: [], createdDate: Date(), taggedUsers: [])
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .follow(state: .notFollowing), text: "Hello World", user: User(username: "holuck", bio: "", name: (first: "", last: ""), birth: Date(), profilePhoto: URL(string: "https://www.google.com")!, gender: .male, counts: UserCount(follower: 1, following: 1, posts: 1), joinDate: Date()))
            models.append(model)
        }
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
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type {
        case .like(_):
            //like cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.reuseIdentifier, for: indexPath) as? NotificationLikeEventTableViewCell else {fatalError("Can't make NotificationLikeEventTableViewCell")}
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .follow:
            //follow cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.reuseIdentifier, for: indexPath) as? NotificationFollowEventTableViewCell else {fatalError("Can't make NotificationFollowEventTableViewCell")}
//            cell.configure(with: model)
            cell.delegate = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}


//MARK: - NotificationLikeEventTableViewCellDelegate
extension NotificationViewController: NotificationLikeEventTableViewCellDelegate {
    func didTapRelatedPostButtonButton(model: UserNotification) {
        print("Tapped post")
        //Open the post
    }
}

extension NotificationViewController: NotificationFollowEventTableViewCellDelegate {
    func didTapFollowUnFollowButton(model: UserNotification) {
        print("Tapped Follow")
        //perform database update
    }
}
