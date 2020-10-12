//
//  IGFeedPostHeaderTableViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/03.
//

import UIKit

class IGFeedPostHeaderTableViewCell: UITableViewCell {

    static let reuseIdentifier = "IGFeedPostHeaderTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
         //configure the cell
    }

}
