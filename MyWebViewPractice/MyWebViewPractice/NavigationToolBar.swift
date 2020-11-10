//
//  NavigationToolBar.swift
//  MyWebViewPractice
//
//  Created by 김호준 on 2020/11/09.
//

import UIKit
import WebKit


class NavigationToolBar: UIToolbar {
    
    private let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain,
                                             target: ViewController.self, action: #selector(didTapBackButton))
    private let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain,
                                                target: ViewController.self, action: #selector(didTapForwardButton))
    private let reloadButton = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain,
                                               target: ViewController.self, action: #selector(didTapReloadButton))
    private let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.setItems([backButton, forwardButton, space, reloadButton], animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapBackButton() {
        print("didTapBackButton")
    }
    @objc private func didTapForwardButton() {
        
    }
    @objc private func didTapReloadButton() {
        
    }
}
