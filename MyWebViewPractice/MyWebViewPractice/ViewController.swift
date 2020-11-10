//
//  ViewController.swift
//  MyWebViewPractice
//
//  Created by 김호준 on 2020/11/09.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    private let webView = WebView()
    private let toolBar = NavigationToolBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.addSubview(toolBar)
        configureWebView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0).isActive = true
        toolBar.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0).isActive = true
        toolBar.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 0).isActive = true
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0).isActive = true
        webView.bottomAnchor.constraint(equalToSystemSpacingBelow: toolBar.topAnchor, multiplier: 0).isActive = true
        webView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 0).isActive = true
        webView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0).isActive = true
        
    }
    
    private func configureWebView() {
        let url = URL(string: "https://www.apple.com")
        guard let webURL = url else {fatalError("URL을 찾을 수 없습니다!")}
        let request = URLRequest(url: webURL)
        webView.load(request)
    }
}

