//
//  NotificationLikeEventTableViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/11.
//

import UIKit
import SDWebImage  // URL형식으로 이미지를 가져오기 위함.

protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func didTapRelatedPostButtonButton(model: UserNotification)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    static let reuseIdentifier = "NotificationLikeEventTableViewCell"
    
    weak var delegate: NotificationLikeEventTableViewCellDelegate?
    
    private var model: UserNotification?
    
    //MARK: - SubViews
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "@joe liked your photo"
        return label
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "test"), for: .normal)
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(postButton)
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.frame = CGRect(x: 6, y: 3, width: contentView.height - 6, height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2
        
        let size = contentView.height - 4
        postButton.frame = CGRect(x: contentView.width - 6 - size, y: 2, width: size, height: size)
        
        label.frame = CGRect(x: profileImageView.right + 6, y: 0, width: contentView.width - size - profileImageView.width - 18, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postButton.setBackgroundImage(nil, for: .normal)
        label.text = nil
        profileImageView.image = nil
    }
    
    public func configure(with model: UserNotification) {
        self.model = model
        
        //model의 타입 (좋아요, 팔로우)에 따라 나눈다.
        switch model.type {
        case .like(let post):
            let thumbnail = post.thumbnailImage
            guard !thumbnail.absoluteString.contains("google.com") else {return}
            postButton.sd_setBackgroundImage(with: thumbnail, for: .normal, completed: nil)
            
        case .follow:
            break
        }
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Actions
    @objc private func didTapPostButton() {
        guard let model = model else {
            return
        }
        delegate?.didTapRelatedPostButtonButton(model: model)
    }
    
}
