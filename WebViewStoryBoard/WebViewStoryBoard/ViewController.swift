//
//  ViewController.swift
//  WebViewStoryBoard
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var toolBar: ToolBar!
    @IBOutlet weak var searchBar: SearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolBar.toolBarDelegate = self
        searchBar.delegate = self
        webView.config()
        searchBar.config()
    }
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        let inputURL = URL(string: searchBar.text ?? "")
        guard let url = inputURL else {fatalError("찾을 수 없는 URL입니다!")}
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

//MARK: - ToolBarDelegate
extension ViewController: ToolBarDelegate {
    func didTapBackButton() {
        print("did tap Back Button")
        webView.goBack()
    }
    func didTapForwardButton() {
        webView.goForward()
    }
    func didTapReloadButton() {
        webView.reload()
    }
}

//MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
}
