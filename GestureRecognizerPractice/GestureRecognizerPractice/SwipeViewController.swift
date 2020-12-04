//
//  SwipeViewController.swift
//  GestureRecognizerPractice
//
//  Created by 김호준 on 2020/12/05.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet var swipeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(handleSwipeRight(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self,
                                                 action: #selector(handleSwipeLeft(_:)))
        let swipeUp = UISwipeGestureRecognizer(target: self,
                                               action: #selector(handleSwipeUp(_:)))
        let swipeDown = UISwipeGestureRecognizer(target: self,
                                                 action: #selector(handleSwipeDown(_:)))
        swipeRight.direction = .right
        swipeLeft.direction = .left
        swipeUp.direction = .up
        swipeDown.direction = .down
        
        self.swipeView.gestureRecognizers = [swipeUp, swipeDown, swipeLeft, swipeRight]
    }

}

extension SwipeViewController {
    @objc func handleSwipeRight(_ sender: UISwipeGestureRecognizer) {
        print("swipe Right!")
    }
    @objc func handleSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe Left!")
    }
    @objc func handleSwipeUp(_ sender: UISwipeGestureRecognizer) {
        print("swipe Up")
    }
    @objc func handleSwipeDown(_ sender: UISwipeGestureRecognizer) {
        print("swipe Down")
    }
}
