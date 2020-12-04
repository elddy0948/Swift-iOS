//
//  RotationViewController.swift
//  GestureRecognizerPractice
//
//  Created by 김호준 on 2020/12/03.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet var rotationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationGesture(_:)))
        self.rotationView.addGestureRecognizer(rotation)
    }
}

extension RotationViewController {
    @objc func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}
