//
//  MyScrollView.swift
//  ScrollViewAutoLayoutPractice
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class MyScrollView: UIScrollView {
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fill
        return stackView
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(yellowView)
        verticalStackView.addArrangedSubview(blueView)
        verticalStackView.addArrangedSubview(redView)
        self.addSubview(verticalStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(verticalStackView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor))
        constraints.append(verticalStackView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor))
        constraints.append(verticalStackView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor))
        constraints.append(verticalStackView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor))
        constraints.append(verticalStackView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
