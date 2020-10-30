//
//  ViewController.swift
//  StackView
//
//  Created by 김호준 on 2020/10/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
    }
    func createStackView() {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.image = UIImage(systemName: "bell")
        imageView.contentMode = .scaleAspectFit
//        imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive = true
        
        let label = UILabel()
        label.text = "Hello World"
        label.textAlignment = .center
        label.backgroundColor = .systemYellow
        label.font = .systemFont(ofSize: 21, weight: .bold)
//        label.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 100).isActive = true

        let label2 = UILabel()
        label2.text = "Holuck!"
        label2.textAlignment = .center
        label2.backgroundColor = .systemBlue
        label2.font = .systemFont(ofSize: 21, weight: .bold)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label, label2]) // Stack View에 들어갔으면 하는 View들을 담는다.
        stackView.frame = view.bounds
        stackView.backgroundColor = .systemGray
        
        //Config Stack View에서 설정해줘야 할 것들
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.addSubview(stackView)
    }
}

