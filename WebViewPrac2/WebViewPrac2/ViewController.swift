//
//  ViewController.swift
//  WebViewPrac2
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var toolBar: NavigationToolBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://www.apple.com")
        guard let url = myURL else {fatalError("URL Error")}
        let request = URLRequest(url: url)
        webView.load(request)
        toolBar.navigationToolBarDelegate = self
    }
}

extension ViewController: NavigationToolBarDelegate {
    func didTapForwardButton() {
        webView.goForward()
    }
    
    func didTapReloadButton() {
        webView.reload()
    }
    
    func didTapBackButton() {
        webView.goBack()
    }
}

