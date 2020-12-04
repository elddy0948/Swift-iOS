//
//  PanViewController.swift
//  GestureRecognizerPractice
//
//  Created by 김호준 on 2020/12/05.
//

import UIKit

class PanViewController: UIViewController {

    @IBOutlet var panView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        self.panView.addGestureRecognizer(pan)
    }

}
extension PanViewController {
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        gestureView.center = CGPoint(x: gestureView.center.x + translation.x,
                                     y: gestureView.center.y + translation.y)
        
        sender.setTranslation(.zero, in: view)
    }
}
