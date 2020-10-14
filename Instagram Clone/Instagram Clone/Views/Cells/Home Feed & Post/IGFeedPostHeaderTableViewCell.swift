//
//  IGFeedPostHeaderTableViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/03.
//

import SDWebImage
import UIKit

protocol IGFeedPostHeaderTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}

class IGFeedPostHeaderTableViewCell: UITableViewCell {

    static let reuseIdentifier = "IGFeedPostHeaderTableViewCell"
    
    weak var delegate: IGFeedPostHeaderTableViewCellDelegate?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 5
        contentView.addSubview(profileImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(moreButton)
        moreButton.addTarget(self, action: #selector(didTapMoreButton), for: .touchUpInside)
    }
    
    @objc private func didTapMoreButton() {
        delegate?.didTapMoreButton()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.height - 4
        profileImageView.frame = CGRect(x: 2, y: 2,
                                        width: size, height: size)
        profileImageView.layer.cornerRadius = size / 2
        usernameLabel.frame = CGRect(x: profileImageView.right + 10, y: 2,
                                     width: contentView.width - (size * 2) - 15, height: contentView.height - 4)
        moreButton.frame = CGRect(x: contentView.width - size, y: 2,
                                  width: size, height: size)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        usernameLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: User) {
         //configure the cell
        profileImageView.image = UIImage(systemName: "person.circle")
//        profileImageView.sd_setImage(with: model.profilePhoto, completed: nil)
        usernameLabel.text = model.username
    }
    

}
