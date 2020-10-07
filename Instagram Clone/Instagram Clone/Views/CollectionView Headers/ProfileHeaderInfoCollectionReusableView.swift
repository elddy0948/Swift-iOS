//
//  ProfileHeaderInfoCollectionReusableView.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/05.
//

import UIKit

protocol ProfileHeaderInfoCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileHeaderInfoCollectionReusableView)
    func profileHeaderDidTapFollowerButton(_ header: ProfileHeaderInfoCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileHeaderInfoCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileHeaderInfoCollectionReusableView)
}

final class ProfileHeaderInfoCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "ProfileHeaderInfoCollectionReusableView"
    public weak var delegate: ProfileHeaderInfoCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follower", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    
    //MARK: - Label init
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Holuck"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.textColor = .label
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Profile Image Frame
        let profilePhotoSize = width / 4
        profilePhotoImageView.frame = CGRect(x: 5, y: 5,
                                             width: profilePhotoSize, height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        
        // Button Frame
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width - 10 - profilePhotoSize) / 3
        postButton.frame = CGRect(x: profilePhotoImageView.right, y: 5,
                                  width: countButtonWidth, height: buttonHeight).integral
        followerButton.frame = CGRect(x: postButton.right, y: 5,
                                      width: countButtonWidth, height: buttonHeight).integral
        followingButton.frame = CGRect(x: followerButton.right, y: 5,
                                       width: countButtonWidth, height: buttonHeight).integral
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: buttonHeight + 5,
                                         width: countButtonWidth * 3, height: buttonHeight).integral
        
        // Label Frame
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        nameLabel.frame = CGRect(x: 5, y: profilePhotoImageView.bottom + 5, width: width - 10, height: 50).integral
        bioLabel.frame = CGRect(x: 5, y: nameLabel.bottom, width: width - 10, height: bioLabelSize.height).integral
    }
    
    //MARK: -Private
    private func addSubViews() {
        addSubview(profilePhotoImageView)
        addSubview(postButton)
        addSubview(followerButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    private func addButtonActions() {
        postButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        followerButton.addTarget(self, action: #selector(didTapFollowerButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    //MARK: - Button Actions
    @objc private func didTapFollowerButton() {
        delegate?.profileHeaderDidTapFollowerButton(self)
    }
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostButton(self)
    }
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
