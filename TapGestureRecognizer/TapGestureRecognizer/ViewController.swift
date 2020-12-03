//
//  ViewController.swift
//  TapGestureRecognizer
//
//  Created by 김호준 on 2020/12/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taps = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.myView.addGestureRecognizer(taps)
    }
}

extension ViewController {
    @objc func handleTapGesture(recognizer: UITapGestureRecognizer) {
        print("Touch MyView")
    }
}

