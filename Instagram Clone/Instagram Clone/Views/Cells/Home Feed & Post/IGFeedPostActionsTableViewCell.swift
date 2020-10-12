//
//  IGFeedPostActionsTableViewCell.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/03.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "IGFeedPostActionsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen
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
