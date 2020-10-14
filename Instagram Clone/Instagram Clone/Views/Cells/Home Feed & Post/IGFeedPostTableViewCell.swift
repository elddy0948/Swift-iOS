//
//  IGFeedPostTableViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/03.
//

import AVFoundation // for video
import SDWebImage
import UIKit

/// Cell For primary post Content
final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "IGFeedPostTableViewCell"
    
    private var player: AVPlayer?
    private var playerLayer = AVPlayerLayer()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = nil
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        postImageView.frame = contentView.bounds
        playerLayer.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with post: UserPost) {
         //configure the cell
        postImageView.image = UIImage(named: "test")
        return
        switch post.postType {
        case .photo:
            //show image
            postImageView.sd_setImage(with: post.postURL, completed: nil)
        case .video:
            // load and play video
            player = AVPlayer(url: post.postURL)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
        }
    }
}
