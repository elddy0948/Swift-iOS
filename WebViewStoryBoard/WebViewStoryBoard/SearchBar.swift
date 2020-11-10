//
//  SearchBar.swift
//  WebViewStoryBoard
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit

class SearchBar: UISearchBar {
    public func config() {
        //SearchBar 좌측에 icon 없애주기.
        self.setImage(UIImage(), for: .search, state: .normal)
        self.keyboardType = .URL
        self.textContentType = .URL
        self.returnKeyType = .go
        self.autocapitalizationType = .none
    }
}
