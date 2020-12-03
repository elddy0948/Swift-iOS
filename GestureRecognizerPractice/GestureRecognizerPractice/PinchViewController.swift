//
//  PinchViewController.swift
//  GestureRecognizerPractice
//
//  Created by 김호준 on 2020/12/03.
//

import UIKit

class PinchViewController: UIViewController {

    @IBOutlet var pinchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(sender:)))
        self.pinchView.addGestureRecognizer(pinch)
    }
}

extension PinchViewController {
    @objc func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
}
