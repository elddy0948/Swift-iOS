//
//  ProfileTabsCollectionReusableView.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/05.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "ProfileTabsCollectionReusableView"
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
