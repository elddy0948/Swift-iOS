//
//  ViewController.swift
//  ScrollViewAutoLayoutPractice
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var myScrollView: MyScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView = MyScrollView()
        guard let scrollView = myScrollView else {
            return
        }
        view.addSubview(scrollView)
        setupConstraints(with: scrollView)
    }
    
    private func setupConstraints(with scrollView: MyScrollView) {
        var constraints = [NSLayoutConstraint]()
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}

