//
//  WebView.swift
//  WebViewStoryBoard
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit
import WebKit

class WebView: WKWebView {
    public func config() {
        let myURL = URL(string: "https://www.apple.com")
        guard let url = myURL else {fatalError("URL Error!")}
        let request = URLRequest(url: url)
        self.load(request)
    }
}
