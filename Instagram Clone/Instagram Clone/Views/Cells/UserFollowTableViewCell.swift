//
//  UserFollowTableViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/11.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: UserRelationship)
}

enum FollowState {
    case following
    case notFollowing
}
struct UserRelationship {
    let username: String
    let name: String
    let type: FollowState
}

class UserFollowTableViewCell: UITableViewCell {
    static let reuseIdentifier = "UserFollowTableViewCell"
    
    public weak var delegate: UserFollowTableViewCellDelegate?
    private var model: UserRelationship?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Holuck"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "@holucky123"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(followButton)
        selectionStyle = .none
        followButton.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.frame = CGRect(x: 3, y: 3,
                                        width: contentView.height - 6, height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2
        
        let buttonWidth = contentView.width > 500 ? 220.0 : contentView.width / 3
        followButton.frame = CGRect(x: contentView.width - 5 - buttonWidth, y: (contentView.height - 40) / 2,
                                    width: buttonWidth, height: 40)
        
        let labelHeight = contentView.height / 2
        nameLabel.frame = CGRect(x: profileImageView.right + 5, y: 0,
                                 width: contentView.width - 8 - profileImageView.width - buttonWidth, height: labelHeight)
        usernameLabel.frame = CGRect(x: profileImageView.right + 5, y: nameLabel.bottom,
                                     width: contentView.width - 8 - profileImageView.width - buttonWidth, height: labelHeight)
    }
    
    public func configure(with model: UserRelationship) {
        usernameLabel.text = model.username
        nameLabel.text = model.name
        self.model = model
        
        switch model.type {
        case .following:
            //show unfollow button
            followButton.setTitle("Unfollow", for: .normal)
            followButton.setTitleColor(.label, for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = UIColor.label.cgColor
        
        case .notFollowing:
            //show follow button
            followButton.setTitle("Follow", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .link
            followButton.layer.borderWidth = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Actions
    
    @objc private func didTapFollowButton() {
        guard let model = model else {return}
        delegate?.didTapFollowUnfollowButton(model: model)
    }
}
