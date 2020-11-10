//
//  WebView.swift
//  MyWebViewPractice
//
//  Created by 김호준 on 2020/11/09.
//

import UIKit
import WebKit

class WebView: WKWebView {
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
