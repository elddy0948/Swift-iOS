//
//  ProfileTabsCollectionReusableView.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/05.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "ProfileTabsCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
