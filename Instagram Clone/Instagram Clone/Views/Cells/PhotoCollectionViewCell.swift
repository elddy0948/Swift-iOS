//
//  PhotoCollectionViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/05.
//

import SDWebImage
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoCollectionViewCell"
    //Profile에 들어갈 Photo Collection View
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User Post Image"
        accessibilityHint = "Double-Tap to open post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -public
    public func configure(with model: UserPost) {
        let thumbnailURL = model.thumbnailImage
        photoImageView.sd_setImage(with: thumbnailURL, completed: nil)
    }
    public func configure(debug imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}
