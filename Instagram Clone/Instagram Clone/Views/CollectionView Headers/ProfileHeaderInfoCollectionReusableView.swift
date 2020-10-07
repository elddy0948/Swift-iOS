//
//  ProfileHeaderInfoCollectionReusableView.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/05.
//

import UIKit

class ProfileHeaderInfoCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "ProfileHeaderInfoCollectionReusableView"
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        return button
    }()
    
    private let followerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follower", for: .normal)

        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)

        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width / 4
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width - 10 - profilePhotoSize) / 3
        
        profilePhotoImageView.frame = CGRect(x: 5, y: 5,
                                             width: profilePhotoSize, height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        postButton.frame = CGRect(x: profilePhotoImageView.right, y: 5,
                                  width: countButtonWidth, height: buttonHeight).integral
        followerButton.frame = CGRect(x: postButton.right, y: 5,
                                      width: countButtonWidth, height: buttonHeight).integral
        followingButton.frame = CGRect(x: followerButton.right, y: 5,
                                       width: countButtonWidth, height: buttonHeight).integral
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
}
