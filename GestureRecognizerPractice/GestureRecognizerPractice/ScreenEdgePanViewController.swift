//
//  ScreenEdgePanViewController.swift
//  GestureRecognizerPractice
//
//  Created by 김호준 on 2020/12/05.
//

import UIKit

class ScreenEdgePanViewController: UIViewController {

    @IBOutlet var screenEdgePanView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenEdgePan = UIScreenEdgePanGestureRecognizer(target: self,
                                                             action: #selector(handleScreenEdgePan))
        screenEdgePan.edges = .left
        self.screenEdgePanView.addGestureRecognizer(screenEdgePan)
    }
}
extension ScreenEdgePanViewController {
    @objc func handleScreenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: screenEdgePanView)
        print("Translation : \(translation)")
    }
}
