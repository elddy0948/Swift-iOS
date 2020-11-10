//
//  NavigationToolBar.swift
//  WebViewPrac2
//
//  Created by 김호준 on 2020/11/10.
//

import UIKit

protocol NavigationToolBarDelegate: AnyObject {
    func didTapBackButton()
    func didTapForwardButton()
    func didTapReloadButton()
}

class NavigationToolBar: UIToolbar {
    weak var navigationToolBarDelegate: NavigationToolBarDelegate?
    
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        navigationToolBarDelegate?.didTapBackButton()
    }
    @IBAction func didTapForwardButton(_ sender: UIBarButtonItem) {
        navigationToolBarDelegate?.didTapForwardButton()
    }
    @IBAction func didTapReloadButton(_ sender: UIBarButtonItem) {
        navigationToolBarDelegate?.didTapReloadButton()
    }
}
