//
//  ViewController.swift
//  StackViewPractice
//
//  Created by 김호준 on 2020/11/01.
//

import UIKit

class ViewController: UIViewController {
    
    private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        
        let emailLabel: UILabel = {
            let label = UILabel()
            label.text = "Here is Email Text Field"
            label.backgroundColor = .green
            return label
        }()
        
        let passwordLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .blue
            label.text = "Here is Password Text Field"
            return label
        }()
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(passwordLabel)
        stackView.backgroundColor = .yellow
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stackView.frame = CGRect(x: 0, y: view.frame.size.width,
                                 width: view.frame.size.width, height: 80)
    }
}

