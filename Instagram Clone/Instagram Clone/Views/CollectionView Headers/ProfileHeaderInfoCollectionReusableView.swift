//
//  ProfileHeaderInfoCollectionReusableView.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/10/05.
//

import UIKit

class ProfileHeaderInfoCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "ProfileHeaderInfoCollectionReusableView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
